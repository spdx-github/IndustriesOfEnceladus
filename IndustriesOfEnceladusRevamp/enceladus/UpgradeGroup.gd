extends "res://enceladus/UpgradeGroup.gd"

export (Array, String) var onlyForShipModels = []
export (bool) var invertModelLogic = false
export (Array, String) var onlyForShipNames = []
export (bool) var invertNameLogic = false

func reexamine():	
	var ship = CurrentGame.getPlayerShip()
	
	.reexamine()
	# don't override base logic
	if visible:
		if onlyForShipModels.size() > 0:
			var logic
			
			if onlyForShipModels.find(ship.model) >= 0:
				logic = true
			else:
				logic = false
			
			if invertModelLogic:
				visible = not logic
			else:
				visible = logic
				
		if onlyForShipNames.size() > 0:
			var logic
			
			if onlyForShipNames.find(ship.shipName) >= 0:
				logic = true
			else:
				logic = false
			
			if invertNameLogic:
				visible = not logic
			else:
				visible = logic
