extends Label

func _process(delta):
	text = String(Global.highscore)
	
	if Global.points > Global.highscore:
		Global.highscore = Global.points
