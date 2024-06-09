extends "res://ships/modules/MineralProcessingUnit.gd"

export (bool) var removeThis = false

func _ready():
	var mounted = ship.getConfig(slot)
	
	if removeThis:
		Tool.remove(self)
		
	if mounted == systemName:
		if ship.processedCargoStorage == "amorphic":
			ship.processedCargoCapacity += internalStorage * 6
		else:
			ship.processedCargoCapacity += internalStorage
