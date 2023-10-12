extends CharacterBody3D
const SPEED = 10
const JUMP_VELOCITY = 10
var twist_input:=0.0;
var pitch_input:=0.0;
var jump_max = 3;
var jump_count = 0;

@export var mouse_sensetivity:=0.001
@export var pitch_min=0
@export var pitch_max=-60

var jump_animation_state = 0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity") * 2
@onready var twist_pivot=$twist
@onready var pitch_pivot=$twist/pitch
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _unhandled_input(event:InputEvent)->void:
		if event is InputEventMouseMotion:
			if Input.get_mouse_mode()== Input.MOUSE_MODE_CAPTURED:
				twist_input = -event.relative.x * mouse_sensetivity
				pitch_input = - event.relative.y * mouse_sensetivity
				
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	twist_pivot.rotate_y(twist_input)
	pitch_pivot.rotate_x(pitch_input)
	pitch_pivot.rotation.x =clamp(
		pitch_pivot.rotation.x,
		deg_to_rad(pitch_max),
		deg_to_rad(pitch_min))
	pitch_input=0.0
	twist_input=0.0
		
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		if velocity.y <= 0:
			$AnimationPlayer.play("Fall")

	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			# Initial jump from the ground.
			jump_count = 1
			jump_animation_state = 1
			velocity.y = JUMP_VELOCITY
		elif jump_count < jump_max:
			# Double jump if not on the ground and haven't reached max jumps.
			jump_count += 1
			jump_animation_state += 1
			if jump_animation_state == 2:
				$JumpParticle.emitting = true
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_forward", "move_back")
	var direction = (twist_pivot.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
		$Sketchfab_model.rotation.y = atan2(direction.x, direction.z)
		$CollisionPolygon3D.rotation.y = atan2(direction.x, direction.z)
		if jump_animation_state == 0:
			$AnimationPlayer.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	if direction or velocity.y > 0:
		if jump_animation_state == 1 and not is_on_floor():
			$AnimationPlayer.play("Jump")
		elif jump_animation_state == 2 and not is_on_floor():
			$AnimationPlayer.play("Jump2")
		elif jump_animation_state == 3 and not is_on_floor():
			$AnimationPlayer.play("Fall2")

	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if is_on_floor():
		if velocity.y <= 0:
			jump_animation_state = 0
		if velocity.x == 0 and velocity.z == 0:
			$AnimationPlayer.play("Idle")

		
	move_and_slide()
	
