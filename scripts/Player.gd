extends KinematicBody2D

const gravity = 1000
const jump_impulse = 400
const for_speed = 100
var velocity = Vector2()

var starting_pos = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	starting_pos = global_position


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
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		
		if collision.collider.name == "Spikes":
			die()


func die():
	# TODO: play some kind of death animation/sound 
	
	# Reset the player to its starting pos.
	set_global_position(starting_pos)
