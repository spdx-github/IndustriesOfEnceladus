extends "res://ships/ship-ctrl.gd"

func sensorGet(sensor):
	match sensor:
		"hold":
			match processedCargoStorageType:
				"divided":
					return processedCargoCapacity * 6
				"amorphic":
					return processedCargoCapacity
				"mono":
					return processedCargoCapacity
		"hold.fill":
			return getProcessedCargoMass() / sensorGet("hold")
		_:
			return .sensorGet(sensor)

func hasFbw()->bool:
	var type = getAutopilotType()
	
	match type:
		"SYSTEM_AUTOPILOT_337MOD":
			return true
		_:
			return .hasFbw()
	
func autopilotControl(delta, fbw = false):
	var type = getAutopilotType()
	
	var solveThrust:bool
	var observeRotation:bool
	var computeRotation:bool

	match type:
		"SYSTEM_AUTOPILOT_337MOD":
			solveThrust = true
			observeRotation = true
			computeRotation = false
			
	.autopilotControl(delta, hasFbw())
