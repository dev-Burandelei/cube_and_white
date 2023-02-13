extends Line2D

var move
var a = false
var b = false
var c = false
var d = false
func _ready():
	set_as_toplevel(true)
	
	
func _process(_delta):
	move = false
	if Input.is_action_pressed("move_back"):
		move = true
		add_point(get_parent().global_position)
		if a == false:
			for i in range(50):
				remove_point(i)
		
	elif Input.is_action_pressed("move_forward"):
		move = true
		add_point(get_parent().global_position)
		for i in range(50):
			remove_point(i)
		
	elif Input.is_action_pressed("move_left"):
		move = true
		add_point(get_parent().global_position)
		for i in range(50):
			remove_point(i)
			
	elif Input.is_action_pressed("move_right"):
		move = true
		add_point(get_parent().global_position)
		for i in range(50):
			remove_point(i)
	
	if move == false:
		clear_points()
		


