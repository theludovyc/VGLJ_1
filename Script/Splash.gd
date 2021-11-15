extends Sprite
class_name Splash

onready var tween = $Tween

const max_scale = 1.5

func _ready():
	tween.interpolate_property(self, "scale", null, Vector2(max_scale, max_scale), 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.interpolate_property(self, "modulate:a", null, 0, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()

#func _on_AudioStreamPlayer2D_finished():
#
#	pass # Replace with function body.


func _on_Tween_tween_all_completed():
	queue_free()
