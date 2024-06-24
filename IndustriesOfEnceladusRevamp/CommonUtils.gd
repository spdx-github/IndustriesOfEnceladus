extends Node

# frequently used internal function
# this is usually set with a static self call in place of from,
# but here it's a safer call with a loop breakout
func getShip(from:Node = self, maxLoops = 10):
	var node = from
	var counter = 0
	
	while not node.has_method("getConfig") and node != null:
		node = node.get_parent()
		counter += 1
		if counter > maxLoops:
			Debug.l("%s exceeded max loop limit!" % from.name)
			return ERR_PRINTER_ON_FIRE
		
	return node
