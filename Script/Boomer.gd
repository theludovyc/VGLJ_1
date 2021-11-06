extends Area2D
class_name Boomer

signal explode

const SPEED = 1

var target:Node2D
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var game = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func pop_explosion():
	var explo = game.Explosion.instance()
	explo.position = position
	game.add_child(explo)

func explode():
	emit_signal("explode")
	call_deferred("pop_explosion")
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(target.position)
	
	position += Vector2.RIGHT.rotated(rotation) * SPEED
	
	if position.distance_to(target.position) < 60:
		explode()
	
#	pass


func _on_Boomer_area_entered(area):
	if (area is Bullet
		or area is Explosion):
		explode()
