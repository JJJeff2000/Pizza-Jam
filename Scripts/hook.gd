extends CharacterBody2D

var speed = 100
@onready var start_pos = self.global_position

func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	else:
		velocity.x = 0
	
	velocity.y = speed
	
	move_and_slide()
