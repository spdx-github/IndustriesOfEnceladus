extends Node2D

export  var systemName = "SYSTEM_CARGO_MOD"
export  var slot = "cargo.modifier"
export  var repairReplacementPrice = 0
export  var repairReplacementTime = 0
export  var repairFixPrice = 0
export  var repairFixTime = 0
export (float) var mass = 0
var enabled = true
export var registerExternal = false

var ship

func _ready():
	var ship = getShip()
	return true
	
func getShip():
	var c = self
	while not c.has_method("getConfig") and c != null:
		c = c.get_parent()
	return c
