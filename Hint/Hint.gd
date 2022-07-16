extends Area2D


export var text : String
var time : int = 3 
var tween_values = [1 , 3]
export var action : String
onready var action_array = InputMap.get_action_list(action)


func _ready():
	var input = "%s.png" % action_array[0].as_text().to_lower()
	var key_texture = load("res://Assets/Tiles/%s" % input)
	$Key.set_texture(key_texture)
	$Key.set_visible(false)
	$Label.set_visible(false)
	$Label.set_text(text)
	$Timer.set_wait_time(time)
	$CPUParticles2D.set_emitting(false)
	$Tween.connect("tween_completed", self, "_on_tween_completed")
	_start_tween()


func _start_tween():
	$Tween.interpolate_property($Light2D,"texture_scale",
		tween_values[0],tween_values[1],time,
		Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()
	$CPUParticles2D.set_emitting(!$CPUParticles2D.is_emitting())


func _on_tween_completed(_object,_key):
	tween_values.invert()
	_start_tween()


func _on_Hint_body_shape_entered(_body_rid, body, _body_shape_index, _local_shape_index):
	if body is Player:
		$Label.set_visible(true)
		$Key.set_visible(true)
		$CPUParticles2D.set_emitting(false)
		$Timer.start()


func _on_Timer_timeout():
	self.queue_free()
