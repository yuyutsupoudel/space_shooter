extends Control


func _on_Start_pressed():
	get_tree().change_scene(GameStats.levels[GameStats.current_level])


func _on_Setting_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
