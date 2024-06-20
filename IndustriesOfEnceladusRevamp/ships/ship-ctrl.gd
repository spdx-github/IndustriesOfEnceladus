extends "res://ships/ship-ctrl.gd"

func sensorGet(sensor):
	match sensor:
		"hold":
			match processedCargoStorageType:
				"divided":
					return processedCargoCapacity * 6
				"amorphic":
					return processedCargoCapacity
		_:
			return .sensorGet(sensor)
