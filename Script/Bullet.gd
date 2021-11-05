extends Area2D
class_name Bullet

const SPEED = 20

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += Vector2.RIGHT.rotated(rotation) * SPEED
	
	if !get_viewport_rect().has_point(position):
		queue_free()
#	pass
