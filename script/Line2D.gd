extends Line2D

var move

func _ready():
	set_as_toplevel(true)

func _process(_delta):
	add_point(get_parent().global_position)
	
	if (points.size() > 30 or move == false) and points.size() != 0:
		remove_point(0)
