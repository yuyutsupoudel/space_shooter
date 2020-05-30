extends KinematicBody2D
var MAX_FALL = 90
var FRICTION = 30
var GRAVITY = 50
var MAX_SPEED = 225
var velocity = Vector2.ZERO
var rotation_speed = 4
signal shoot

onready var Booster = $Booster
onready var Bullet = preload("res://Others/PlayerBullet.tscn")

func _ready():
	GameStats.connect("player_died",self,"queue_free")

func player_queue_free():
	queue_free()
	
func _physics_process(delta):
	get_player_input(delta)

	if !is_on_floor():
		velocity.y += GRAVITY*delta
		if velocity.y>=MAX_FALL:
			velocity.y=MAX_FALL
# warning-ignore:return_value_discarded
	move_and_slide(velocity,Vector2.UP)
	if is_on_ceiling():
		velocity.y=GRAVITY
func shoot():
	var dir = Vector2(0,-1).rotated(global_rotation)
	emit_signal("shoot",Bullet,$Position2D.global_position,dir)
	
func get_player_input(delta):
	var rotation_direction = 0
	if Input.is_action_just_pressed("ui_shoot"):
		shoot()
		print(GameStats.current_level)
	if Input.is_action_pressed("ui_right"):
		rotation_direction +=1
	if Input.is_action_pressed("ui_left"):
		rotation_direction-=1
	if Input.is_action_just_pressed("ui_up"):
		Booster.play("start")
	if Input.is_action_just_released("ui_up"):
		Booster.play("stop")
	if Input.is_action_pressed("ui_up"):
		velocity +=  Vector2(0,-MAX_SPEED*delta).rotated(rotation)
	else:
		velocity = velocity.move_toward(Vector2.ZERO,FRICTION*delta)
	rotation+=rotation_direction*rotation_speed*delta
