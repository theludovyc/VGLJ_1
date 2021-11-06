extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	$Acronym.hide()
	$Text2002.hide()
	$Text2006.hide()
	$Text2021.hide()
	$Acronym.hide()
	$Continue.hide()
	$ballon.hide()
	$Ballons.hide()
	$alien_head.hide()
	$alien_head_shadow.hide()
	$alien_head_red_eyes.hide()
	

	
	$AnimationPlayer.play("Intro")
	yield($AnimationPlayer,"animation_finished")
	$Timer.start()
	yield($Timer,"timeout")
	
	
	$AnimationPlayer.play("Title")
	yield($AnimationPlayer,"animation_finished")
	
	# tester si event keyb pour continuer sinon tempo et suite
	$AnimationPlayer.play("2002")
	yield($AnimationPlayer,"animation_finished")
	$Continue.show()
	
	$Continue.hide()
	# tester si event keyb pour continuer sinon tempo et suite
	$AnimationPlayer.play("2006")
	yield($AnimationPlayer,"animation_finished")
	$AnimationPlayer.play("Ballons")
	yield($AnimationPlayer,"animation_finished")
	$Continue.show()
	
	# tester si event keyb pour continuer sinon tempo et suite
	
	$Text2002.hide()
	$Text2006.hide()
	$ballon.hide()
	$Ballons.hide()
	$AnimationPlayer.play("2021")
	yield($AnimationPlayer,"animation_finished")
	
	var __ = get_tree().change_scene("res://Scene/Menu.tscn")


