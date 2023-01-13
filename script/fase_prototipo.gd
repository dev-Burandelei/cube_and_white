extends Node2D

var Enemy = preload("res://Cenas/Enemy.tscn")


func _ready():
	pass # Replace with function body.



func _on_TimerEnemy_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)

	
