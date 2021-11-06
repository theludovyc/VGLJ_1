extends KinematicBody2D

var Bullet = preload("res://Scene/Bullet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = 300

onready var timer = $Timer

var firing := false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func getAxis(inputA, inputB):
	return int(Input.is_action_pressed(inputA))-int(Input.is_action_pressed(inputB))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var dir:Vector2
	dir.x = getAxis("ui_right", "ui_left")
	dir.y = getAxis("ui_down", "ui_up")
	
	dir = dir.normalized()
	
	move_and_slide(dir*SPEED)
	
	look_at(get_global_mouse_position())
	
	if !firing and Input.is_action_just_pressed("mouse_left"):
		firing = true
		timer.start()
	
	if firing and Input.is_action_just_released("mouse_left"):
		firing = false
		timer.stop()
#	pass


func _on_Timer_timeout():
	if firing:
		var bullet = Bullet.instance()
		bullet.position = position
		bullet.rotation = rotation
		get_parent().add_child(bullet)
