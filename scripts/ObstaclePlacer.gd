extends Node2D

# Level vars
var player
var speed
var total_distance
var inv_total_distance
var distance = 0

var time_elapsed = 0
var potential_locs = []

# Music vars
const bpm = 130
const time_sig = 4

# Soundcue vars
const timing = 2
var soundcue_locs = []
var next_loc
var ctr = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	# Initialize player-dependent variables
	player = get_node("/root/Node2D/Guy")
	speed =  player.for_speed
	total_distance = speed * 60
	inv_total_distance = float(total_distance) / bpm
	
	print(inv_total_distance)
	
	# Calculate all x coords that line up with a given bpm
	for i in range(bpm + 1):
		potential_locs.append(i * inv_total_distance)
	
	print(potential_locs)
	
	# Choose some spots for sound cues
	for j in range(2, 120, 2):
		soundcue_locs.append(potential_locs[j])
	
	# Set next_loc to the first soundcue location
	next_loc = soundcue_locs[0]
	
	$Song.play()


# 480 fps fps
func _physics_process(delta):
	# Calculate the elapsed time and travelled distance.
	time_elapsed += delta
	distance = time_elapsed * speed
	
	# Play a sound if the player has reached a soundcue location.
	if distance > next_loc && ctr < len(soundcue_locs) - 1:
		$SoundCueClick.play()
		
		ctr += 1
		next_loc = soundcue_locs[ctr]
