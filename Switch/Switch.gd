extends Area2D

func _ready():
	pass # Replace with function body.


func _on_AnimatedSprite_body_entered(body):
	if body.get_name() == "Player":
		body.on_switch_area = true


func _on_AnimatedSprite_body_exited(body):
	if body.get_name() == "Player":
		body.on_switch_area = false
