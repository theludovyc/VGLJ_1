extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var audio = $AudioStreamPlayer2D
onready var tween = $Tween

var state = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Phaser_explode():
	if state == 0:
		queue_free()

func _on_Timer_timeout():
	state = 1
	audio.play()
	tween.interpolate_property(self, "scale:y", null, 1.5, 1, Tween.TRANS_EXPO, Tween.EASE_IN)
	tween.start()

func _on_AudioStreamPlayer2D_finished():
	print("hello")
	queue_free()
	pass # Replace with function body.
