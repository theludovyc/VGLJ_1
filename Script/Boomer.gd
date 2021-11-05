extends Area2D

var target:Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(target.position)
	
	position += Vector2.RIGHT.rotated(rotation) * 2
	
#	pass
