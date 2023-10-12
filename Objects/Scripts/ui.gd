extends CanvasLayer

func _process(delta):
	$MarginContainer/HBoxContainer/Label.text = str(Globals.targets_destroyed)

