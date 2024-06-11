extends "res://enceladus/UpgradeGroup.gd"

export (Array, String) var onlyForShipNames
export (bool) var invertNameLogic = false

func reexamine():
	.reexamine()
	
	var ship = CurrentGame.getPlayerShip()
	
	print("Ship is %s" % String(ship))
	
	if onlyForShipNames.size() > 0:
		var logic
		#print("Patching %s for %s" % [self.name, ship.shipName])
		
		if onlyForShipNames.find(ship.shipName) >= 0:
			logic = true
			#print("In onlyForShipNames")
		else:
			logic = false
			#print("Not in onlyForShipNames")
		
		if invertNameLogic:
			visible = not logic
		else:
			visible = logic
