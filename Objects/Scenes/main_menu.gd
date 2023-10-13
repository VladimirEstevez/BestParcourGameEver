extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/VBoxContainer/MarginContainer/play_button.grab_focus()# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://player.tscn") # Replace with function body.


func _on_options_button_pressed():
	var options_scene = (load("res://Objects/Scenes/player_scene.tscn") as PackedScene).instantiate()
	
	# var instance = (load(scene_file_path) as PackedScene).instantiate() Load the scene
	#get_tree().current_scene.add_child(options_scene)  # Add the instance as a child


func _on_exit_button_pressed():
	get_tree().quit() # Replace with function body.


func _on_video_stream_player_finished():
	$CanvasLayer/AspectRatioContainer/VideoStreamPlayer.play() # Replace with function body.

func set_bus_volume_percentage(bus_name, percentage):
	# Convert percentage to linear scale (0 to 1)
	var linear_volume = percentage / 100.0

	# Convert linear scale to dB
	var volume_db = linear_to_db(linear_volume)

	var bus_index = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, volume_db)

func set_volume(level):
	match level:
		"max":
			set_bus_volume_percentage("Master", 90)
			# Set the volume to the maximum level
		"med":
			set_bus_volume_percentage("Master", 50)
			# Set the volume to a medium level
		"min":
			set_bus_volume_percentage("Master", 10)
			# Set the volume to the minimum level

func _on_option_button_item_selected(index):
	match index:
		0:
			# "Max" selected, set volume to maximum
			set_volume("max")
		1:
# "Med" selected, set volume to medium
			set_volume("med")
		2:
# "Min" selected, set volume to minimum
			set_volume("min")
 # Replace with function body.
