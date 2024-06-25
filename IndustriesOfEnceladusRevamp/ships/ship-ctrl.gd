extends "res://ships/ship-ctrl.gd"

func _ready():
	CurrentGame.validateEmployment()

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
		"crew.quality":
			return crewMoraleBonus + 1
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

# done to make crew count increases work
# i call setupShip to safe crew count increases prior to actually increasing
# them with CrewModifiers
func setupShip():
	self.setConfig("crewCount", crew)
	.setupShip()
