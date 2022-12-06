extends KinematicBody2D

const gravity = 1000
const jump_impulse = 400
const for_speed = 100
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if is_on_floor():
		velocity.y = 0
		if Input.is_action_just_pressed("player_jump"):
			velocity.y -= jump_impulse
			$JumpAudio.play()
	else:
		velocity.y += gravity * delta
		
	velocity.x = for_speed
		
	move_and_slide(velocity, Vector2.UP)
