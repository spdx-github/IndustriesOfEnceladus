extends "res://CurrentGame.gd"

func _ready():
	var usedShipRollsMax:int = 4
	# names of ships, ages, probability of appearing
	var shipNames = {
		"ATK225-Stub": [15, 0.2],
		"ATLAS-Wasp": [50, 0.1],
		"Cothon-Lux": [200, 0.4],
		"Eagle-Prospector-Pigeon": [40, 0.1],
		"MAD-CERF-Civ": [120, 0.3],
		"Oberon": [80, 0.2],
		"OCP-209-DD": [60, 0.3],
		"OCP-209-Snap": [60, 0.2],
		"RA-TRTL-OCP": [120, 0.1],
		"RA-TRTL-Ram": [120, 0.2],
		"Tsukuyomi-Decom": [83, 0.1],
	}
	
	for key in shipNames.keys():
		# algorithm for ship rarity
		var randomRolls:int = ceil(shipNames[key][1] * usedShipRollsMax)
		
		for i in range(randomRolls):
			usedShipsPool.append({
				"name":key,
				"age":24 * 3600 * 365 * shipNames[key][0]
			})
	
		Debug.l("Added %s instances of %s to usedShipsPool" %
			[String(randomRolls), key])

# need to do this so that maxMembers is valid
func validateEmployment():
	var ship = getPlayerShip()
	var preferredCrew = state.ship.config.get("preferredCrew", getCurrentlyActiveCrewNames())
	var maxMembers = state.ship.config.get("crewCount")
	var maxActive = maxMembers
	var changed = false
	if ship.zone != "rings":
		for memberName in state.crew:
			var member = state.crew[memberName]
			var preferActve = preferredCrew.has(memberName)
			if preferActve:
				var wasActive = isCrewMemberActive(member)
				if not isCrewOnLeave(member):
					if not wasActive:
						member.active = true
						changed = true
						
					maxMembers -= 1
					if maxMembers < 0:
						member.active = false
						changed = true
			else :
				if isCrewMemberActive(member):
					member.active = false
					changed = true
	if maxMembers <= 0:
		Achivements.achive("CREW_FULL")
		
	for memberName in state.crew:
		var member = state.crew[memberName]
		if member.get("active", false):
			maxActive -= 1
			
	for memberName in state.crew:
		var member = state.crew[memberName]
		if maxActive < 0 and isCrewOnLeave(member):
			maxActive += 1
			member.active = false
			changed = true
			
	if changed:
		emit_signal("employmentChanged")
