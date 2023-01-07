extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Back.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Back_pressed():
	get_tree().change_scene("res://scenes/Main-Menu.tscn")
