extends CanvasLayer

func _process(delta):
	$TargetCount/HBoxContainer/Label.text = str(Globals.targets_destroyed)

