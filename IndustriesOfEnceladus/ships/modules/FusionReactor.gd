extends "res://ships/modules/FusionReactor.gd"

func _ready():
	power = ship.getConfig("fusion.power", power / 1000) * 1000
	thermalReactorPower = ship.getConfig("fusion.thermal", thermalReactorPower / 100000) * 100000
