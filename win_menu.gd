extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass


func _on_replay_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")