extends Node

var Boomer = preload("res://Scene/Boomer.tscn")
var Splash = preload("res://Scene/Splash.tscn")
var Phaser = preload("res://Scene/Phaser.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var player = $Player

onready var mid_screen := Vector2(1366, 768)

onready var timer = $TimerSwarm
onready var timerPhaser = $TimerPhaser

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		var __ =get_tree().change_scene("res://Scene/Menu.tscn")

	
#	if timer.is_stopped() and Input.is_action_just_pressed("ui_accept"):
#		timer.start()
#		timerPhaser.start()

func getSpawnSwarmVector() -> Vector2:
	return Vector2.RIGHT.rotated(rand_range(0, 2*PI)) * rand_range(0, 260) + mid_screen;

func _on_TimerSwarm_timeout():
	for i in rand_range(2, 4):
		var boomer = Boomer.instance()
		boomer.target = player
		boomer.position = getSpawnSwarmVector() + Vector2(rand_range(-64, 64), rand_range(-64, 64))
		boomer.connect("explode", $Player/Camera2D, "shake")
		add_child(boomer)

func getSpawnPhaserVector() -> Vector2:
	var mid = mid_screen/2.0
	return (mid_screen + Vector2(rand_range(-mid.x, mid.x), rand_range(-mid.y, mid.y)))

func _on_TimerPhaser_timeout():
	var phaser = Phaser.instance()
	phaser.target = player
	phaser.position = getSpawnPhaserVector()
	add_child(phaser)
