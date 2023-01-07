extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()

func _on_StartButton_pressed():
	var _error = get_tree().change_scene("res://scenes/Main.tscn")

func _on_OptionsButton_pressed():
	var _error = get_tree().change_scene("res://scenes/Options.tscn")
	# alternative way:
	#var options = load("res://scenes/Options.tscn").instance()
	#get_tree().current_scene.add_child(options)

func _on_QuitButton_pressed():
	get_tree().quit()
