extends KinematicBody2D


enum{MOVE, DASH, GANCHO, DEAD}

var STATE

onready var gancho := $gancho as RayCast2D
var qte_gancho = 1
var ganching = false 

const Dash_Speed = 750
export var Dash_duration = 0.05
var direction_dash = Vector2()
var is_dashing = true
var can_dash = true
var qte_dash = 1
var sprite
var ghost_scene = preload("res://Cenas/DashGhost.tscn")
var impactD = 0



var speed = 200
var velocity = Vector2()

var death
var blood_particule = preload("res://Cenas/Blood.tscn")


func _ready():
	STATE = MOVE
	is_dashing = false
	Global.player = self
		
func _exit_tree():
	Global.player = null
	
	
func _physics_process(delta):
	
	global_update()
	match STATE:
		
		MOVE: 
			move(delta)
			_input(delta)
			
		DASH:
			dash_state(delta)
			_input(delta)
			
		GANCHO:
			gancho_state()
			_input(delta)
		
		DEAD:
			pass
			
		
func _input(_delta):
	
	gancho.look_at(get_global_mouse_position())
	if Input.is_action_pressed("move_back") :
		velocity += Vector2(0,1)
		$fx_dash.rotation_degrees = rad2deg(velocity.angle())
		
		
	if Input.is_action_pressed("move_forward"):
		velocity += Vector2(0,-1)
		$fx_dash.rotation_degrees = rad2deg(velocity.angle())
		
	if Input.is_action_pressed("move_left"):
		velocity += Vector2(-1, 0)
		$fx_dash.rotation_degrees = rad2deg(velocity.angle())
			
	if Input.is_action_pressed("move_right"):
		velocity += Vector2(1,0)
		$fx_dash.rotation_degrees = rad2deg(velocity.angle() * -1)
	
	
	if Input.is_action_pressed("dash") and can_dash and !is_dashing and qte_dash > 0 and (velocity.x != 0 or velocity.y != 0):
		STATE = DASH
		$fx_dash.set_emitting(true)
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
	is_dashing = false
	can_dash = true
	impactD = 1
	$wait.start(0.4)
	
func dash_state(_delta):
	velocity = velocity.normalized()
	var _aux = move_and_slide(velocity * Dash_Speed)
	
func gancho_state():
	velocity = global_position.direction_to(gancho.get_collision_point())
	velocity = velocity.normalized()
	var _aux = move_and_slide(velocity * speed * 7)
	STATE = MOVE
	 
func global_update():
	
	Global.dash = qte_dash
	Global.gancho = qte_gancho
	Global.dead = death
	
	if qte_dash > 0:
		Global.Can_Dash = true
	else: 
		Global.Can_Dash = false
	
	if qte_gancho > 0:
		Global.Can_Gancho = true 
	else:
		Global.Can_Gancho = false
		
func gameover():
	Global.camera.shakeCamera(30)
	var blood = blood_particule.instance()
	add_child(blood)
	blood.rotation_degrees = rad2deg(velocity.angle())
	$Sprite.hide()
	$"CollisionShape2D".queue_free()
	STATE = DEAD
	death = true
	
	$wait_death.start(1.5)
	


func _on_wait_death_timeout():
	assert(get_tree().change_scene("res://Cenas/GAMEOVER.tscn") == OK)


func _on_wait_timeout():
	STATE = MOVE
	print("aaaaaa")
		
	

	
