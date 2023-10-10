extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Coin_Idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	$Sketchfab_model/d6e085e50c5e47a5906ddea1c6e771ac_fbx/RootNode/Coin1/Coin1_MaterialStar_0.disabled = true
	$AnimationPlayer.play("Collect Coin")
	pass # Replace with function body.
