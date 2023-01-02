extends Control




func _on_Reset_pressed():
	assert(get_tree().change_scene("res://Cenas/Teste.tscn") == OK)



func _on_Quit_pressed():
	get_tree().quit()
