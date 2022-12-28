extends Sprite


export var n_dash = 3


func _on_Area2D_body_entered(body):
	body.qte_dash = n_dash
	queue_free()
