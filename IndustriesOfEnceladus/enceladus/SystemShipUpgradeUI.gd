extends "res://enceladus/SystemShipUpgradeUI.gd"

func isAvailable():
	if "_ALT" in .getName():
		var ship = CurrentGame.getPlayerShip()
		if ship.get("baseShipName") != "SHIP_PROSPECTOR" or ship.get("shipName") == "SHIP_PROSPECTOR_BALD":
			return false
	return .isAvailable()
 
