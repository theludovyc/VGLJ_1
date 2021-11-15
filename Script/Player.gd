extends Area2D

var Bullet = preload("res://Scene/Bullet.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const SPEED = 300

const MARGIN = 100

onready var viewport_size:Vector2 = get_viewport_rect().size

onready var timer = $Timer
onready var audio = $AudioStreamPlayer2D
onready var sprite = $AnimatedSprite
onready var tween = $Tween

var firing := false

var life := 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func getAxis(inputA, inputB):
	return int(Input.is_action_pressed(inputA))-int(Input.is_action_pressed(inputB))

func _process(delta):
	if !firing and Input.is_action_just_pressed("mouse_left"):
		firing = true
		timer.start()
	
	if firing and Input.is_action_just_released("mouse_left"):
		firing = false
		timer.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var dir:Vector2
	dir.x = getAxis("ui_right", "ui_left")
	dir.y = getAxis("ui_down", "ui_up")
	
	dir = dir.normalized()
	
	position += dir*SPEED*delta
	
	sprite.look_at(get_global_mouse_position())
	sprite.rotate(PI/2)
	
	position.x = clamp(position.x, MARGIN, 1366*2-MARGIN)
	position.y = clamp(position.y, MARGIN, 768*2-MARGIN)

func pop_bullet():
	var bullet = Bullet.instance()
	bullet.position = position
	bullet.rotation = sprite.rotation + rand_range(-0.25, 0.25) -PI/2
	get_parent().add_child(bullet)

func _on_Timer_timeout():
	if firing:
		pop_bullet()
		pop_bullet()
		pop_bullet()
		audio.play()

func take_damage():
	tween.interpolate_property(sprite, "modulate", Color.white, Color.red, 0.2, Tween.TRANS_CUBIC, Tween.EASE_IN)
	tween.interpolate_property(sprite, "modulate", Color.red, Color.white, 0.2, Tween.TRANS_CUBIC, Tween.EASE_IN, 0.2)
	tween.start()
	$Label.text = str(life)
	life -= 1
	if life <= 0:
		var __ = get_tree().change_scene("res://Scene/Fin.tscn")

func _on_Player_area_entered(area):
	if area is Splash:
		take_damage()
