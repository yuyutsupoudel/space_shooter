extends Control


func _on_Button_pressed():
	get_tree().change_scene(GameStats.levels[GameStats.current_level+1])

func _on_Button2_pressed():
	pass # Replace with function body.


func _on_Button3_pressed():
	get_tree().change_scene("res://UI/Start_menu.tscn")
