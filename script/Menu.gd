extends Control





func _on_START_pressed():
	assert(get_tree().change_scene("res://Cenas/Teste.tscn") == OK)
	


func _on_QUIT_pressed():
	get_tree().quit()
