extends KinematicBody2D
var MAX_SPEED = 1000
var speed = 70
var FRICTION = 50
var ACCLERATION = 100
var velocity = Vector2.ZERO
var rotation_speed = 5
signal shoot

onready var Booster = $Booster
onready var Bullet = preload("res://Others/PlayerBullet.tscn")

func _physics_process(delta):
	get_player_input(delta)
	move_and_slide(velocity)
func shoot():
	var dir = Vector2(0,-1).rotated(global_rotation)
	emit_signal("shoot",Bullet,$Position2D.global_position,dir)
	
func get_player_input(delta):
	var rotation_direction = 0
	if Input.is_action_just_pressed("ui_shoot"):
		shoot()
	if Input.is_action_pressed("ui_right"):
		rotation_direction +=1
	if Input.is_action_pressed("ui_left"):
		rotation_direction-=1
	if Input.is_action_just_pressed("ui_up"):
		Booster.play("start")
	if Input.is_action_just_released("ui_up"):
		Booster.play("stop")
	if Input.is_action_pressed("ui_up"):
		velocity = Vector2(0,-speed).rotated(rotation)
	else:
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION*delta)
	rotation+=rotation_direction*rotation_speed*delta
