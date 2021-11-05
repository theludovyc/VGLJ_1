extends Node

var Boomer = preload("res://Scene/Boomer.tscn")

var Explosion = preload("res://Scene/Explosion.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = $Player

onready var mid_screen := get_viewport().size / 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Timer_timeout():
	var boomer = Boomer.instance()
	boomer.target = player
	var vec = Vector2.RIGHT.rotated(rand_range(0, 2*PI)) * mid_screen.x + mid_screen
	print(vec)
	boomer.position = vec
	add_child(boomer)
