extends Node

var msgs = [	"Oh, I need to rest right now...",
				"I'm going to sleep.",
				"Zzz... Zzz... Zzz...",
				"Aaaargh, fricking lights!",
				"I forgot to shut them down.\nI'll do so.",
				"...",
				"I'm not scared of the darkness.\nAm I?"
			]
onready var msg_index = -1

func _input(event):
	if event is InputEventKey and event.pressed:
		next_msg()



func next_msg():
	$Timer.stop()
	$Timer.start(10)
	if msg_index >= msgs.size() -1:
		Game.emit_signal("ChangeScene","res://Levels/TestScene.tscn")
	else:
		msg_index += 1
		$Message.text = msgs[msg_index]


func _on_Timer_timeout():
	next_msg()
