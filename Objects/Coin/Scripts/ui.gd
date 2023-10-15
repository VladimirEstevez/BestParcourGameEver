extends CanvasLayer

var start_time = 0
var timer_label

func _ready():
	start_time = Engine.get_frames_drawn() + Engine.get_frames_per_second()  # Record the start time 60 seconds from now
	timer_label = $Timer/HBoxContainer/Label
	$AnimationPlayer.play("StartFlash")
	$"../AudioStreamPlayer3D".play()
	

func _process(delta):
	$MarginContainer/HBoxContainer/Label.text = str(Globals.targets_destroyed)
	var current_time = Engine.get_frames_drawn()
	var elapsed_frames = current_time - start_time
	var remaining_seconds = 90 - elapsed_frames * delta

	var formatted_time = format_time(remaining_seconds)
	if formatted_time == "00:00.000":
		get_tree().change_scene_to_file("res://lose_menu.tscn")
		
	timer_label.text = "Time: " + formatted_time

func format_time(seconds):
	var minutes = int(seconds / 60)
	var remaining_seconds = int(seconds) % 60
	var milliseconds = int((seconds - int(seconds)) * 1000)

	return str(minutes).pad_zeros(2) + ":" + str(remaining_seconds).pad_zeros(2) + "." + str(milliseconds).pad_zeros(3)

