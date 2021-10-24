extends KinematicBody2D

var speed = 20
var jumpForce = 300
var gravity = 500

var vel = Vector2()

onready var imagePlayer = get_node("player")

func _physics_process(delta):
	if Input.is_action_pressed("player_left"):
		vel.x -= speed
	elif Input.is_action_pressed("player_right"):
		vel.x += speed
	
	vel.y += gravity * delta
	
	if Input.is_action_pressed("player_jump") and is_on_floor():
		vel.y -= jumpForce 
	
	vel = move_and_slide(vel, Vector2.UP)
	
	if vel.x < 0:
		imagePlayer.flip_h = true
	elif vel.x > 0:
		imagePlayer.flip_h = false

