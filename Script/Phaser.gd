extends Area2D

signal explode

const SPEED = 0.5
const shoot_range = 400

var Laser = preload("res://Scene/PhaserLaser.tscn")

onready var timer = $Timer
onready var game = get_parent()

var target:Node2D

var needToMove = true

var life = 5

var state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	match(state):
		0:
			look_at(target.position)
	
			position += Vector2.RIGHT.rotated(rotation) * SPEED
	
			if position.distance_to(target.position) < shoot_range:
				state = 1
				
		1:
			timer.start()
			var laser = Laser.instance()
			connect("explode", laser, "_on_Phaser_explode")
			laser.position = position
			laser.rotation = rotation
			get_parent().add_child(laser)
			state = 2

func _on_Timer_timeout():
	state = 0

func pop_explosion():
	var explo = game.Explosion.instance()
	explo.position = position
	game.add_child(explo)

func explode():
	emit_signal("explode")
	call_deferred("pop_explosion")
	queue_free()

func _on_Phaser_area_entered(area):
	if (area is Bullet
		or area is Explosion):
		life -= 1
		if life < 0:
			explode()
