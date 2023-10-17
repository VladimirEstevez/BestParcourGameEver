extends CanvasLayer

var start_time = 0
var timer_label

func _ready():
	start_time = Time.get_unix_time_from_system() + 90  # Record the start time 60 seconds from now
	timer_label = $Timer/HBoxContainer/Label
	$AnimationPlayer.play("StartFlash")

func _process(delta):
	# Coins
	$MarginContainer/HBoxContainer/Label.text = str(Globals.targets_destroyed)
	
	var current_time = Time.get_unix_time_from_system()

	var elapsed_seconds = current_time - start_time
	var remaining_seconds = 0 - elapsed_seconds
	
	save_final_time(90-remaining_seconds)

	if remaining_seconds <= 0:
		get_tree().change_scene_to_file("res://Scenes/lose_menu.tscn")
	
	timer_label.text = "Time: " + format_time(remaining_seconds)
	

func format_time(seconds):
	var minutes = int(seconds / 60)
	var remaining_seconds = int(seconds) % 60
	return str(minutes).pad_zeros(2) + ":" + str(remaining_seconds).pad_zeros(2)
		
func save_final_time(finalTime):
	Globals.final_time = finalTime
	
