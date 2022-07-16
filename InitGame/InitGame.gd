extends Node

var msgs = [	"START1",
				"START2",
				"START3",
				"START4",
				"START5",
				"START6",
				"START7",
			]
onready var msg_index = -1

func _input(event):
	if event is InputEventKey and event.pressed:
		next_msg()



func next_msg():
	$Timer.stop()
	$Timer.start(10)
	if msg_index >= msgs.size() -1:
		Game.emit_signal("ChangeScene","res://Levels/Level1.tscn")
	else:
		msg_index += 1
		$Message.text = tr(msgs[msg_index])


func _on_Timer_timeout():
	next_msg()
