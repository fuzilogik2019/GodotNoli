extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body.get_name() == 'Player':
		get_tree().call_group("lights", "turn_off")
