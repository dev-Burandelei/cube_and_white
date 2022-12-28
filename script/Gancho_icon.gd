
extends Sprite


export var n_gancho = 3


func _on_Area2D_body_entered(body):
	body.qte_gancho = n_gancho
	queue_free()
