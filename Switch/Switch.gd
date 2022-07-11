extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_AnimatedSprite_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
#	if body.get_name() == 'Player' and Input.is_action_pressed("Interact"):
	if body.get_name() == 'Player':
		get_tree().call_group("lights", "toggle")
