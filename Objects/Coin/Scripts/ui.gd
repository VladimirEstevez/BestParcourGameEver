extends CanvasLayer

var start_time = 0
var timer_label

func _ready():
	start_time = Engine.get_frames_drawn()  # Record the start time
	timer_label = $Timer/HBoxContainer/Label

func _process(delta):
	$MarginContainer/HBoxContainer/Label.text = str(Globals.targets_destroyed)
	var current_time = Engine.get_frames_drawn()
	var elapsed_frames = current_time - start_time
	var elapsed_seconds = elapsed_frames * delta

	var formatted_time = format_time(elapsed_seconds)
	timer_label.text = "Time: " + formatted_time

func format_time(seconds):
	var minutes = int(seconds / 60)
	var remaining_seconds = int(seconds) % 60
	var milliseconds = int((seconds - int(seconds)) * 1000)

	return str(minutes).pad_zeros(2) + ":" + str(remaining_seconds).pad_zeros(2) + "." + str(milliseconds).pad_zeros(3)
