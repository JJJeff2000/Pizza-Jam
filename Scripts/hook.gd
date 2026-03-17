extends CharacterBody2D

var speed = 100

func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	
	velocity.y = speed
	
	move_and_slide()
