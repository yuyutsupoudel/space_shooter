extends Area2D
var speed = 150



var velocity
func start(_position,_direction):
	position = _position
	rotation = _direction.angle()
	velocity = _direction *speed
	
func _process(delta):
	position +=velocity*delta


func _on_Bullet_body_entered(body):
	explode()
	body.queue_free()

func explode():
	queue_free()
	
	
func _on_LifeTime_timeout():
	explode()
	
