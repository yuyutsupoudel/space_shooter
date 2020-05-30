extends Node
var player_life = 1
var score = 0
var current_level = 0
var  levels =["res://World/Test world.tscn","res://World/Level 1.tscn"]
signal player_died
func player_health_change():
	#change UIs
	if player_life<0:
		player_died()
	update_player_data()
	
func player_health_decrease(value):
	player_life-=value
	player_health_change()

func player_health_increase(value):
	player_life+=value
	player_health_change()

func add_score(value):
	score+=value
	update_player_data()

func update_player_data():
	#update score ui
	pass
	
func player_died():
	reset_values()
	emit_signal("player_died")
func reset_values():
	pass
