extends "res://IndustriesOfEnceladusRevamp/ships/modules/BaseModifier.gd"

export (int) var crewCountChange = 0
export (float) var moraleChange = 0.0

func extend(ship):
	var crewCap = ship.get("crew")
	var crewMorale = ship.get("crewMoraleBonus")
	
	ship.set("crew", crewCap + crewCountChange)
	ship.set("crewMoraleBonus", crewMorale + moraleChange)
