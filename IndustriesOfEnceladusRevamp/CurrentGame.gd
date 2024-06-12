extends "res://CurrentGame.gd"

func _ready():
	#var shipName = "TsukuyomiIOT"
	var shipNames = [
		"Cothon-Lux",
		"MAD-CERF-Civ",
		"Oberon",
		"OCP-209-DD",
		"OCP-209-Snap",
		"Tsukuyomi-Decom",
	]
	
	for name in shipNames:
		usedShipsPool.append({"name":name, "age":24 * 3600 * 365 * 200})
	
		Debug.l("Added %s to usedShipsPool" % name)
