extends "res://IndustriesOfEnceladus/ships/modules/BaseModifier.gd"

export (float) var cargoScannerSampleMult = 1.0
export (float) var cargoScannerSampleSpeed = 1.0

func _ready():
	ship = getShip()
	print("Fired!")
	var huds = ship.get_node("Hud").get_node("Huds")
	print("Got huds!")
	
	if not huds.is_null_or_void():
		for hud in huds.get_children():
			
			var cargoScanner = hud.find_node("CargoScanner", true)
			
			print("CargoScanner is ", cargoScanner, ", check showShip: ", cargoScanner.showShip)
			
			cargoScanner["samplesPerSecond"] *= cargoScannerSampleMult
			cargoScanner["samplesMax"] *= cargoScannerSampleMult
			cargoScanner["updateCountsEvery"] /= cargoScannerSampleSpeed
	else:
		print("Error, huds is null/void")
	
	return ._ready()
