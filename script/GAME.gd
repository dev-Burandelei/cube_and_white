extends Control


func _ready():
	Global.time = 15
	Global.dead = null
	
func _process(_delta):
	if Global.dead:
		print("a")
		$CanvasLayer2/AnimetionDead.play("dead")
	
func _on_Timer_timeout():
	Global.time -= 1
	_over()

func _over():
	if Global.time == 0:
		var _aux = get_tree().change_scene("res://Cenas/GAMEOVER.tscn")



