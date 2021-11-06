extends Node2D

var phase :=0
var phase0 : bool=false
var phase1 : bool=false
var phase2 : bool=false
var phase3 : bool=false
var phase4 : bool=false
# Called when the node enters the scene tree for the first time.
func _ready():
	phase=0
	phase0 =false
	phase1 =false
	phase2 =false
	phase3 =false
	phase4 =false
	$Acronym.hide()
	$Text2002.hide()
	$Text2006.hide()
	$StarWars.hide()
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
	$Timer.start()
	yield($Timer,"timeout")
	phase=phase+1
	phase0 = true

func _process(delta):
	if phase0 :
		match (phase):
			
			1:
				if !phase1 :
					phase1 = true
					$AnimationPlayer.play("2002")
					yield($AnimationPlayer,"animation_finished")
					$Continue.show()
				
			2:
				if !phase2 :
					phase2 = true
					$Continue.hide()
					$AnimationPlayer.play("2006")
					yield($AnimationPlayer,"animation_finished")
					$AnimationPlayer.play("Ballons")
					yield($AnimationPlayer,"animation_finished")
					$Continue.show()
				
			3:
				if !phase3 :
					phase3 = true
					$Continue.hide()
					$Text2002.hide()
					$Text2006.hide()
					$ballon.hide()
					$Ballons.hide()
					$StarWars.show()
					$AnimationPlayer.play("2021")
					yield($AnimationPlayer,"animation_finished")
					$Timer.start()
					yield($Timer,"timeout")
					phase=phase+1
					
			4:
				if !phase4 :
					phase4 = true	
					var __ = get_tree().change_scene("res://Scene/Menu.tscn")

func _unhandled_input(event):
	if phase0 :
			if event.is_action_pressed("ui_accept"):
				phase=phase+1
