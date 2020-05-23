extends KinematicBody2D
var MAX_FALL = 80
var FRICTION = 30
var GRAVITY = 50
var MAX_SPEED = 200
var velocity = Vector2.ZERO
var rotation_speed = 5
signal shoot

onready var Booster = $Booster
onready var Bullet = preload("res://Others/PlayerBullet.tscn")

func _physics_process(delta):
	get_player_input(delta)
	if is_on_ceiling():
		velocity.y=0
	if !is_on_floor():
		velocity.y += GRAVITY*delta
		if velocity.y>=MAX_FALL:
			velocity.y=MAX_FALL
	move_and_slide(velocity,Vector2.UP)

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
		velocity = velocity + Vector2(0,-MAX_SPEED*delta).rotated(rotation)
	else:
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION*delta)
	rotation+=rotation_direction*rotation_speed*delta

func get_sign(value):
	var dir = Vector2.ZERO
	if value.x>0:
		dir.x=1
	else:
		dir.x=-1
	if value.y>0:
		dir.y=1
	else:
		dir.y=-1
	return dir
