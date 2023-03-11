extends Sprite


var getmagnet = false
var bodies
var velocity = Vector2()

func _physics_process(_delta):
	if getmagnet == true:
		_magnet(bodies)

func _on_Area2D_body_entered(body):
	bodies = body
	getmagnet = true
	
	
func _magnet(body):
	body.global_position += self.position - bodies.position



func _on_Area2D_body_exited(_body):
	getmagnet = false
