extends Line2D

var move

func _ready():
	set_as_toplevel(true)

func _process(_delta):
	move = false
	if Input.is_action_pressed("move_back") or Input.is_action_pressed("move_forward") or Input.is_action_pressed("move_left") or Input.is_action_pressed("move_right") or Input.is_action_pressed("dash"):
		add_point(get_parent().global_position)
		move = true
	
	if (points.size() > 30 or move == false) and points.size() != 0:
		remove_point(0)
