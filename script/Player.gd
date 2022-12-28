extends KinematicBody2D


enum{MOVE, DASH, GANCHO}

var STATE

onready var gancho := $gancho as RayCast2D
var qte_gancho = 3
var ganching = false 

const Dash_Speed = 200
export var Dash_duration = 0.4
var direction_dash = Vector2()
var is_dashing = true
var can_dash = true
var qte_dash = 3

var speed = 100
var velocity = Vector2()

func _ready():
	STATE = MOVE
	is_dashing = false
	Global.player = self
		
func _exit_tree():
	Global.player = null
	
	
func _physics_process(delta):
	match STATE:
		
		MOVE: 
			move(delta)
			_input(delta)
			
		DASH:
			dash_state(delta)
			
		GANCHO:
			gancho_state()
			
		
func _input(_delta):
	if Input.is_action_pressed("move_back") :
		velocity += Vector2(0,1)
		gancho.cast_to = Vector2(0,300)
		
	elif Input.is_action_pressed("move_forward"):
		velocity += Vector2(0,-1)
		gancho.cast_to = Vector2(0,-300)
		
	elif Input.is_action_pressed("move_left"):
		velocity += Vector2(-1, 0)
		gancho.cast_to = Vector2(-300,0)
		
	elif Input.is_action_pressed("move_right"):
		velocity += Vector2(1,0)
		gancho.cast_to = Vector2(300,0)
	
	if Input.is_action_just_pressed("dash") and can_dash and !is_dashing and qte_dash > 0:
		STATE = DASH
		is_dashing = true
		can_dash = false
		qte_dash = qte_dash - 1
		$DashTimer.start(Dash_duration)
		
	if Input.is_action_just_released("gancho") and ganching:
			qte_gancho = qte_gancho - 1
			ganching = false
			print("b")
			
	if Input.is_action_pressed("gancho") and qte_gancho > 0:
		if gancho.is_colliding():
			STATE = GANCHO
			ganching = true
			print("a")
		
	

func move(_delta):
	velocity = velocity.normalized()
	var _aux = move_and_slide(velocity * speed)
	velocity = Vector2(0,0)

func _on_DashTimer_timeout():
	STATE = MOVE
	is_dashing = false
	can_dash = true
	
func dash_state(_delta):
	var _aux = move_and_slide(velocity * Dash_Speed)
	
func gancho_state():
	velocity = position.direction_to(gancho.get_collision_point())
	velocity = velocity.normalized()
	var _aux = move_and_slide(velocity * speed * 15)
	STATE = MOVE
	 
