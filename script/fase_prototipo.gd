extends Node2D


var Enemy = preload("res://Cenas/Enemy.tscn")
var Enemy1 = preload("res://Cenas/Enemy_bullet1.tscn")
var Enemy2 = preload("res://Cenas/Enemy_Bullet2.tscn")
var Enemy3 = preload("res://Cenas/Bullet_big.tscn")

func _ready():
	pass # Replace with function body.



func _on_TimerEnemy_timeout():
	var enemy = Enemy.instance()
	add_child(enemy)
	var enemy1 = Enemy1.instance()
	add_child(enemy1)
	





func _on_TimerBullet_big_timeout():
	var enemy3 = Enemy3.instance()
	add_child(enemy3)


func _on_TimerFinal_timeout():
	var enemy2 = Enemy2.instance()
	add_child(enemy2)

