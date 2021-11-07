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
	
	if (position.x<0) or (position.x>1366*2):
		queue_free()
	if (position.y<0) or (position.y>768*2):
		queue_free()	
	
#	pass


func _on_Bullet_area_entered(area:Node):
	if area.is_in_group("Aliens"):
		queue_free()
