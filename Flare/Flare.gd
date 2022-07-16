extends RigidBody2D

var flare_time : float = 10
var time : float = 1.5
var tween_values = [0.2 , 1]

func _ready():
	$Tween.connect("tween_completed", self, "_on_tween_completed")
	_start_tween()
	var t = Timer.new()
	t.set_wait_time(flare_time)
	t.set_one_shot(true)
	self.add_child(t)
	t.connect("timeout",self,"_on_Timer_timeout")
	t.start()


func _start_tween():
	$Tween.interpolate_property($Light2D,"texture_scale",
		tween_values[0],tween_values[1],time,
		Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
	$Tween.start()


func _on_Timer_timeout():
	self.queue_free()


func _on_tween_completed(_object,_key):
	tween_values.invert()
	_start_tween()

