extends Control

func _ready():
	Global.time = 60

func _on_Timer_timeout():
	Global.time -= 1
	_over()

func _over():
	if Global.time == 0:
		var _aux = get_tree().change_scene("res://Cenas/GAMEOVER.tscn")
