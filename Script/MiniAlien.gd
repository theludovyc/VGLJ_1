extends Control

var raleur_texte = [
		"Nan Mais t'es sérieux!",
		"Oh faut pas pousser!",
		"Qu'estce qu'on ta dis !",
		"T'abuse méduse",
		"C'est qu'un bouton...",
		"J'avais parié sur toi!",
		"Cliquer ne pas cliquer... Ouais on a compris!",
		"Même sans lui on dominera le monde",
		"Je me demandais si il marchait qaund même !"
		]
		

func _ready():
	pass
	


func raleur():
	self.show()
	$Timer.start()
	var item = raleur_texte[randi() % raleur_texte.size()]
	$bulle/Label_Raleur.text=item
	yield($Timer,"timeout")
	self.hide()
