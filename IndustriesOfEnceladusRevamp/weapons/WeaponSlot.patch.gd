extends "res://ships/WeaponSlot.gd"

func loadPlaceholder():
	var t = "weaponSlot.%s.type" % slot
	var placeholder:InstancePlaceholder = get_node_or_null(String(mounted))
	if placeholder:
		if directMount:
			key = name + "_" + mounted
		else :
			key = t + "_" + mounted
			
		placeholder.replace_by_instance()
			
		system = get_node_or_null(mounted)
		system.name = name + "_" + system.name
		system.visible = true
		if key in system:
			system.key = key
		if "slotName" in system:
			system.slotName = t + "_" + system.systemName
	ship.changeExternalPlaceholders( - 1)
