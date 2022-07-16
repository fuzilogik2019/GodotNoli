extends Sprite

func _ready():
	pass

func _on_Area2D_body_entered(body):
	if body.get_name() == 'Player':
		if !body.lights:
      SfxManager.play("won")
			get_parent().next_scene()

			

