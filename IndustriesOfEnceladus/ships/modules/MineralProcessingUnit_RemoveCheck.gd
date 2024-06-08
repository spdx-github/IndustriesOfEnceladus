extends "res://ships/modules/MineralProcessingUnit.gd"

export (bool) var removeThis = false

func _ready():
	var t = "weaponSlot.%s.type" % slot
	var mounted = ship.getConfig(t)
	if removeThis:
		ship.removeConfig(t)
		mounted = "SYSTEM_NONE"
