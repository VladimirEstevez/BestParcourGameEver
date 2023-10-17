extends CanvasLayer

var final_time_label

# Called when the node enters the scene tree for the first time.
func _ready():
	final_time_label = $Winner/MarginContainer/VBoxContainer/LabelFinalTime
	final_time_label.text = "Final Time: " + str(format_time(Globals.final_time))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	pass


func _on_replay_pressed():
	get_tree().change_scene_to_file("res://Scenes/World.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
func format_time(seconds):
	var minutes = int(seconds / 60)
	var remaining_seconds = int(seconds) % 60
	return str(minutes).pad_zeros(2) + ":" + str(remaining_seconds).pad_zeros(2)
	
