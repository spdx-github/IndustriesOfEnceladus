extends "res://ships/ship-ctrl.gd"

func getEquipmentMass()->float:
	if equipmentMassCache > 0 and randf() > equipmentMassCacheInvalidateChance:
		return equipmentMassCache
	var m = 0.0
	var systems = getSystems()
	for s in systems:
		var system = systems[s]
		if "mass" in system:
			if "systemMass" in system and system is RigidBody2D:
				m += system.systemMass
			else:
				m += system.mass
	equipmentMassCache = m
	return m
