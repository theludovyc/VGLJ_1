extends Node

var Boomer = preload("res://Scene/Boomer.tscn")
var Explosion = preload("res://Scene/Explosion.tscn")
var Phaser = preload("res://Scene/Phaser.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = $Player

onready var mid_screen := Vector2(1366,768)

onready var timer = $Timer
onready var timerPhaser = $TimerPhaser

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene("res://Scene/Menu.tscn")

	
#	if timer.is_stopped() and Input.is_action_just_pressed("ui_accept"):
#		timer.start()
#		timerPhaser.start()

func pop_swarm(spaw_point:Vector2):
	for i in rand_range(1, 3):
		var boomer = Boomer.instance()
		boomer.target = player
		boomer.position = spaw_point + Vector2(rand_range(-32, 32), rand_range(-32, 32))
		boomer.connect("explode", $Player/Camera2D, "shake")
		add_child(boomer)

func _on_Timer_timeout():
	var vec = Vector2.RIGHT.rotated(rand_range(0, 2*PI)) * mid_screen.x * 1.1 + mid_screen
	pop_swarm(vec)


func _on_TimerPhaser_timeout():
	var vec = Vector2.RIGHT.rotated(rand_range(0, 2*PI)) * mid_screen.x * 1.1 + mid_screen
	var phaser = Phaser.instance()
	phaser.target = player
	phaser.position = vec
	add_child(phaser)
