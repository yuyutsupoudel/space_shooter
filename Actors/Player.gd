extends KinematicBody2D
var MAX_SPEED = 1000
var speed = 70
var FRICTION = 10
var ACCLERATION = 100
var velocity = Vector2.ZERO
var rotation_speed = 5
func _physics_process(delta):
	get_player_input(delta)
	move_and_slide(velocity)
	
func get_player_input(delta):
	var rotation_direction = 0
	if Input.is_action_pressed("ui_right"):
		rotation_direction +=1
	if Input.is_action_pressed("ui_left"):
		rotation_direction-=1
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-speed).rotated(rotation)
		print(velocity)
	else:
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION*delta)
	rotation+=rotation_direction*rotation_speed*delta
