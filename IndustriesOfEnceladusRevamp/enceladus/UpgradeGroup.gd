extends "res://enceladus/UpgradeGroup.gd"

export (Array, String) var onlyForShipNames
export (bool) var invertNameLogic = false
export (Array, String) var onlyForShipModels
export (bool) var invertModelLogic = false

func reexamine():
	var ship = CurrentGame.GetPlayerShip()
	
	if onlyForShipNames:
		if invertNameLogic:
			if ship.model in onlyForShipNames:
				visible = false
		else:
			if not (ship.model in onlyForShipNames):
				visible = false
		
	if onlyForShipModels:
		if invertModelLogic:
			if ship.model in onlyForShipModels:
				visible = false
		else:
			if not (ship.model in onlyForShipModels):
				visible = false
	
	return .reexamine()
