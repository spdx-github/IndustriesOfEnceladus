#extends CollisionPolygon2D
extends RigidBody2D

export  var repairReplacementPrice = 1000
export  var repairReplacementTime = 1
export  var repairFixPrice = 1000
export  var repairFixTime = 1
var equipment = true

export var systemMass = 1000
export  var systemName = "SYSTEM_CARGO_AUX"
export  var slot = "cargo.aux"

export (float, 0, 25000, 1000) var internalStorage = 0.0
export  var registerExternal = false

#export var mirrorCollider = false
#export (Vector2) var mirrorCentreOffset = Vector2(0,0)

var ship

func _ready():
	ship = getShip()
	if ship.getConfig(slot) != systemName:
		Tool.remove(self)
	else :
		visible = true
		if registerExternal:
			ship.externalSystems.append(self)
			
		if ship.processedCargoStorage == "amorphic":
			ship.processedCargoCapacity += internalStorage * 6
		else:
			ship.processedCargoCapacity += internalStorage
			
#		if mirrorCollider:
#			var copy = CollisionPolygon2D.new()
#			var copyTf = self.transform
#			var copyScale = self.scale
#
#			copy.transform = - (copyTf.x) + copyTf.y + mirrorCentreOffset
#			copy.scale = -(copyScale.x) + copyScale.y
#
#			copy.set_script(load("res://ships/MaterialReadout.gd"))
#
#			for child in copy.get_children():
#				copy.remove_child(child)
#
#			ship.call_deferred("add_child", copy)

func getShip():
	var c = self
	while not c.has_method("getConfig") and c != null:
		c = c.get_parent()
	return c
	
