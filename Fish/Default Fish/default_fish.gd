extends CharacterBody2D

enum State {SWIMMING, HOOKED, ESCAPING}

var state = State.SWIMMING

var speed = 50
var weight = 1.0
var value = 10

var direction = Vector2.RIGHT

func _physics_process(delta):
	match state:
		State.SWIMMING:
			swim_behavior()
		State.HOOKED:
			hooked_behavior()

func swim_behavior():
	velocity = direction * speed
	move_and_slide()
	
	if randf() < 0.01:
		direction.x *= -1

func on_hooked():
	state = State.HOOKED

func hooked_behavior():
	velocity.y = -100 / weight
	move_and_slide()
