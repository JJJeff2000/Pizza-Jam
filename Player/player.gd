extends CharacterBody2D

const base_speed = 400

var speed = 400
var current_dir = "none"

func _ready():
	Global.player = self

func _physics_process(_delta) -> void:
	_delta_player_movement()

func _delta_player_movement():
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		velocity.x = speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		velocity.x = -speed
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		velocity.x = 0
		velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		velocity.x = 0
		velocity.y = -speed
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
