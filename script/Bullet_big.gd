extends KinematicBody2D
class_name Bullet_Big_enemy

export var y = 470
export var x = 1400
export var speed = -160
var velocity = Vector2(10,10)


func _ready():
	position.y = 535
	position.x = x


func _physics_process(_delta):
	position.y = y
	velocity.x = speed
	var _aux = move_and_slide(velocity)





func _on_KillerEnemy_body_entered(body):
	body.queue_free()
	assert(get_tree().change_scene("res://Cenas/GAMEOVER.tscn") == OK)
