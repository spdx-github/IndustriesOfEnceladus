extends "res://CurrentGame.gd"

const usedShipRollsMax:int = 5

# names of ships, ages, probability of appearing
var shipNames = {
	"Cothon-Lux": [200, 0.4],
	"MAD-CERF-Civ": [120, 0.3],
	"Oberon": [80, 0.2],
	"OCP-209-DD": [60, 0.3],
	"OCP-209-Snap": [60, 0.2],
	"RA-TRTL-Ram": [120, 0.2],
	"Tsukuyomi-Decom": [83, 0.1],
}

func _ready():
	for key in shipNames.keys():
		# algorithm for ship rarity
		var randomRolls:int = ceil(shipNames[key][1] * usedShipRollsMax)
		
		for i in range(randomRolls):
			usedShipsPool.append({
				"name":key,
				"age":24 * 3600 * 365 * shipNames[key][0]
			})
	
		Debug.l("Added %s instances of %s to usedShipsPool" %
			[String(randomRolls), key])
