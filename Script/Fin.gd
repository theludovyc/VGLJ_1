extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		var __ = get_tree().change_scene("res://Scene/Menu.tscn")
