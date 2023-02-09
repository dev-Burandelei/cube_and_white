extends Camera2D


onready var timer := $Timer as Timer
onready var tween := $Tween as Tween

var shake_amont := 0
var initial_offset := 0 
var default_offset := 5

func _ready():
	set_process(false)
	Global.camera = self
	
func _process(_delta):
	offset = Vector2(rand_range(- shake_amont, shake_amont), rand_range(shake_amont, - shake_amont))
		
func shakeCamera(new_shake, shake_time = 0.15, shake_limit = 25):
	set_process(true)
	shake_amont += new_shake
	
	if shake_amont > shake_limit:
		shake_amont = shake_limit
		
	timer.wait_time = shake_time
	timer.start()

func _on_Timer_timeout():
	set_process(false)
	
	shake_amont = 0 
	var _aux = tween.interpolate_property(self, "offset", initial_offset, default_offset, 0.1, Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
	var _aux2 = tween.start()
