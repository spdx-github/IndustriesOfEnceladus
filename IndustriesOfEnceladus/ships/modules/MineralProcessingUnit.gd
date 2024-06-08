extends "res://ships/modules/MineralProcessingUnit.gd"

func _ready():
	if ship.getConfig(slot) == systemName:
		if ship.processedCargoStorage == "amorphic":
			ship.processedCargoCapacity += internalStorage * 6
		else:
			ship.processedCargoCapacity += internalStorage
