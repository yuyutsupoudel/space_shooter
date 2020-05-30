extends StaticBody2D

func _on_Area2D_body_entered(body):
	GameStats.player_health_decrease(1)
