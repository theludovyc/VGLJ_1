extends Camera2D

#const shake = 20

onready var tween = $Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func shake():
#	tween.interpolate_property(self, "position", Vector2(0, 0), Vector2(rand_range(-shake, shake), rand_range(-shake, shake)), 0.1, Tween.TRANS_ELASTIC, Tween.EASE_IN)
#	tween.interpolate_property(self, "position", null, Vector2(0, 0), 0.1, Tween.TRANS_ELASTIC, Tween.EASE_IN, 0.1)
#	tween.start()
	pass
