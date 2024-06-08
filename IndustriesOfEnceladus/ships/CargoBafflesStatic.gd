extends RigidBody2D

export  var systemName = "SYSTEM_CARGO_BAFFLES"
export  var slot = "cargo.auxequipment"

func _ready():
	var ship
	ship = getShip()
	if ship.getConfig(slot) != systemName:
		Tool.remove(self)
	
func getShip():
	var c = self
	while not c.has_method("getConfig") and c != null:
		c = c.get_parent()
	return c
