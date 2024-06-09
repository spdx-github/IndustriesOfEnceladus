extends CollisionPolygon2D


export  var repairReplacementPrice = 1000
export  var repairReplacementTime = 1
export  var repairFixPrice = 1000
export  var repairFixTime = 1
var equipment = true

export  var mass = 1000

export  var systemName = "SYSTEM_CARGO_AUX"
export  var slot = "cargo.aux"

export (float, 0, 25000, 1000) var internalStorage = 0.0
export  var registerExternal = false

export  var enabled = true

export var mirrorCollider = false

export (Vector2) var flipCentreOffset

var ship

func _ready():
	ship = getShip()
	if ship.getConfig(slot) != systemName:
		Tool.remove(self)
	else :
		visible = true
		if registerExternal:
			ship.externalSystems.append(self)
			
		if mirrorCollider:
			var copy = CollisionPolygon2D.new()
			var copyTf = self.transform
			var copyScale = self.scale
			
			copy.polygon = self.polygon
			copy.transform = - (copyTf.x) + copyTf.y + flipCentreOffset
			copy.scale = -(copyScale.x) + copyScale.y
			
			copy.set_script(load("res://ships/MaterialReadout.gd"))
			
			ship.add_child(copy)
	
func getShip():
	var c = self
	while not c.has_method("getConfig") and c != null:
		c = c.get_parent()
	return c
	
func tryToDraw(cost:Dictionary, unit:float)->bool:
	var have = true
	for m in cost:
		var how = cost[m] * unit
		if ship.getProcessedCargo(m) < how:
			have = false
	if not have:
		return false
		
	for m in cost:
		var how = cost[m] * unit
		ship.removeProcessedCargo(m, how)
	return true
	
