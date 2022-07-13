extends KinematicBody2D

const WALK_SPEED = 1

onready var lights_on = true

var player_pos = Vector2()
var velocity = Vector2()

func _ready():
	visible = false

func toggle():
	lights_on = not lights_on

func _process(_delta):
	visible = not lights_on
	
	if not lights_on:
		player_pos = get_node('../Player').position
		
		if position.x < player_pos.x:
			velocity.x = 1
		elif position.x == player_pos.x:
			velocity.x = 0
		else:
			velocity.x = -1
		
		if position.y < player_pos.y:
			velocity.y = 1
		elif position.y == player_pos.y:
			velocity.y = 0
		else:
			velocity.y = -1
	else:
		velocity = Vector2.ZERO

func _physics_process(_delta):
	position += velocity * 0.4 # Para que no haya colision
