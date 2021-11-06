extends Area2D

const SPEED = 0.5
const shoot_range = 500

onready var timer = $Timer

var target:Node2D

var needToMove = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	look_at(target.position)
	
	if position.distance_to(target.position) > shoot_range:
		position += Vector2.RIGHT.rotated(rotation) * SPEED
	elif timer.is_stopped():
		timer.start()
		
