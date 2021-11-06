extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_About_pressed():
	var __ = get_tree().change_scene("res://Scene/About.tscn")


func _on_Intro_pressed():
	var __ = get_tree().change_scene("res://Scene/Intro.tscn")


func _on_Play_pressed():
	var __ = get_tree().change_scene("res://Scene/Game.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Buttonnone_pressed():
	$MiniAlien.show()
