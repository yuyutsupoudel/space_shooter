extends KinematicBody2D
onready var PlayerDetectionZone = $PlayerDetectionZone
func _physics_process(delta):
	if PlayerDetectionZone.player!=null:
		pass
