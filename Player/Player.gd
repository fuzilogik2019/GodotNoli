extends KinematicBody2D

const WALK_FORCE = 200
const WALK_MAX_SPEED = 70
const STOP_FORCE = 1300
const JUMP_SPEED = 80
const MIN_POWER = 5
const MIN_POWER = 5

onready var flareScene : PackedScene = load ("res://Flare/Flare.tscn")
onready var flare : RigidBody2D
onready var power

var velocity = Vector2()

onready var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Horizontal movement code. First, get the player's input.
	var walk = WALK_FORCE * (Input.get_action_strength("Right") - Input.get_action_strength("Left"))
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
		$AnimatedSprite.play("idle")
	else:
		velocity.x += walk * delta
		$AnimatedSprite.play("run")
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)
	if velocity.x < 0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		
	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	velocity = move_and_slide_with_snap(velocity, Vector2.DOWN, Vector2.UP)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and Input.is_action_just_pressed("Jump"):
		velocity.y = -JUMP_SPEED
		$AnimatedSprite.play("raise")
	elif !is_on_floor() and velocity.y > 0:
		$AnimatedSprite.play("fall")
	
	if Input.is_action_just_pressed('Flare'):
		flare = flareScene.instance()
		power = 0
	elif Input.is_action_pressed("Flare"):
		power += delta
	elif Input.is_action_just_released("Flare"):
		flare.set_position($FlarePosition.get_global_position())
		self.get_tree().get_current_scene().add_child(flare)
		var direction : Vector2 = get_local_mouse_position() * power
		flare.apply_impulse(Vector2.ZERO,direction)
