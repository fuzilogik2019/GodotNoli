extends Sprite


func _on_Area2D_body_entered(body):
	if body.get_name() == 'Player':
		if !body.lights:
			get_parent().next_scene()
