extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Coin_Idle")
	pass # Replace with function body.

func _on_body_entered(body):
	$CollisionShape3D.set_disabled(true)
	$AnimationPlayer.play("Collect Coin")


func deleteObject():
	queue_free()

func add_Coin():
	Globals.targets_destroyed += 1
	if Globals.targets_destroyed == 23:
		get_tree().change_scene_to_file("res://Scenes/win_menu.tscn")
	
func emit_Particule():
	$CoinParticule.emitting = true
	$AudioStreamPlayer3D.play()
