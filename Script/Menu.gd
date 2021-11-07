extends Node2D


func _ready():
	pass # Replace with function body.


func _on_About_pressed():
	var __ = get_tree().change_scene("res://Scene/About.tscn")


func _on_Intro_pressed():
	var __ = get_tree().change_scene("res://Scene/Intro.tscn")


func _on_Play_pressed():
	var __ = get_tree().change_scene("res://Scene/Tuto.tscn")


func _on_Quit_pressed():
	get_tree().quit()


func _on_Buttonnone_pressed():
	$MiniAlien.raleur()
