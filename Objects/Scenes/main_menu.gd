extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/VBoxContainer/play_button.grab_focus()# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://player.tscn") # Replace with function body.


func _on_options_button_pressed():
	var options = load("res://Objects/Scenes/options.tscn")
	get_tree().current_scene.add_child(options) # Replace with function body.


func _on_exit_button_pressed():
	get_tree().quit() # Replace with function body.
