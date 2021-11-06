extends Control





# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Timer.start()
	
	var raleur_texte = [
		"Nan Mais t'es sérieux!",
		"Oh faut pas pousser!",
		"Qu'estce qu'on ta dis !",
		"T'abuse méduse",
		"C'est qu'un bouton...",
		"J'avais parié sur toi!"
		]
	var item = raleur_texte[randi() % raleur_texte.size()]
	$bulle/Label_Raleur.text=item
	yield($Timer,"timeout")
	self.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
