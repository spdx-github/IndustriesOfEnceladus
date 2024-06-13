extends "res://ships/Shipyard.gd"

var modName = "IndustriesOfEnceladusRevamp"

var hardOverrides = {
#	"PROSPECTOR-BALD": preload("res://IndustriesOfEnceladusRevamp/ships/Eagle-Prospector-Bald.tscn"),
#	"PROSPECTOR-FAT": preload("res://IndustriesOfEnceladusRevamp/ships/Eagle-Prospector-Fat.tscn"),
#	"PROSPECTOR-LUX": preload("res://IndustriesOfEnceladusRevamp/ships/Eagle-Prospector-Lux.tscn"),
#	"PROSPECTOR-VP": preload("res://IndustriesOfEnceladusRevamp/ships/Eagle-Prospector-VP.tscn"),
#	"PROSPECTOR": preload("res://IndustriesOfEnceladusRevamp/ships/Eagle-Prospector.tscn"),
}

var shipReplacementPaths = {
	"AT225-B": "ATK225-B", # custom aux modules
	"AT225-R": "ATK225-R",
	"AT225": "ATK225",
	"COTHON-CHK": "Cothon-CHK", # custom aux modules
	"COTHON-LND": "Cothon-Lnd",
	"COTHON-V": "Cothon-V",
	"COTHON": "Cothon",
	"EIME": "EIME",
	"KITSUNE": "kitsune",
	"OCP209": "ocp-209",
	"PROSPECTOR-BALD": "Eagle-Prospector-Bald",
	"PROSPECTOR-FAT": "Eagle-Prospector-Fat", # custom aux modules
	"PROSPECTOR-LUX": "Eagle-Prospector-Lux",
	"PROSPECTOR-VP": "Eagle-Prospector-VP",
	"PROSPECTOR": "Eagle-Prospector",
	"TRTL-44": "RA-TRTL-K44",
	"TRTL-LCB": "RA-TRTL-LCB",
	"TRTL-R": "RA-TRTL-R",
	"TRTL-T": "RA-TRTL-T",
	"TRTL": "RA-TRTL",
}

var newShipNames = {
	"Cothon-Lux": "COTHON",
	"Tsukuyomi-Decom": "TSUKUYOMI", # custom aux modules
	"OCP-209-DD": "OCP209", # custom aux modules
	"OCP-209-Snap": "OCP209",
	"MAD-CERF-Civ": "MADCERF", # custom aux modules
	"Oberon": "OBERON"
}

var shipConfigs = {
	"Cothon-Lux": {"config": {
		"ammo":{
			"capacity": 1000.0, 
			"initial": 1000.0, 
		}, 
		"autopilot":{"type":"SYSTEM_AUTOPILOT_MK2"}, 
		"capacitor":{"capacity": 500.0}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
			"modifierDivided":"SYSTEM_CARGO_MOD_2K"
		},
		"fuel":{
			"capacity": 80000.0, 
			"initial": 80000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_PNTR", 
			"rcs":"SYSTEM_THRUSTER_NDSTR"
		}, 
		"reactor":{	"power": 8.0},
		"shielding":{"emp": 100},  
		"turbine":{"power": 200.0}, 
		"weaponSlot":{
			"right":{"type":"SYSTEM_EMD14"}, 
			"left":{"type":"SYSTEM_NONE"}
		}, 
	}},
	"MAD-CERF-Civ": {"config": {
		"ammo":{
			"capacity":1000.0, 
			"initial":1000.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK1"
		},
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
			"modifierDivided":"SYSTEM_NONE",
		},
		"capacitor":{"capacity":1000.0}, 
		"fuel":{
			"capacity":80000.0, 
			"initial":80000.0, 
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{"power":200.0}, 
		"weaponSlot":{
			"middleLeft":{"type":"SYSTEM_EMD14"}, 
			"middleRight":{"type":"SYSTEM_EMD14"}, 
			"main":{"type":"SYSTEM_SALVAGE_ARM"}
		}, 
	}},
	"Oberon": {"config": {
		"ammo":{
			"capacity":0.0, 
			"initial":0.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK2"
		},  
		"capacitor":{
				"capacity":1500.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_NONE",
			"modifierAmorphic":"SYSTEM_NONE"
		},
		"drones":{
			"initial":0.0, 
			"capacity":0.0, 
		}, 
		"fuel":{
			"capacity": 15000.0, 
			"initial": 15000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K44", 
			"rcs":"SYSTEM_THRUSTER_K69V"
		}, 
		"reactor":{	"power": 30.0},
		"turbine":{
			"capacity":320.0, 
			"power":320.0
		}, 
		"weaponSlot": {
			"mainLeft":{"type":"SYSTEM_SALVAGE_ARM"},
			"mainRight":{"type":"SYSTEM_SALVAGE_ARM"},
		},
	}},
	"OCP-209-DD": {"config": {
		"ammo":{
			"capacity":0.0, 
			"initial":0.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK1"
		},  
		"capacitor":{
				"capacity":1000.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_MPU",
			"aux":"SYSTEM_NONE",
			"modifierAmorphic":"SYSTEM_CARGO_MOD_2K"
		},
		"drones":{
			"initial":0.0, 
			"capacity":0.0, 
		}, 
		"fuel":{
			"capacity": 80000.0, 
			"initial": 80000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K44", 
			"rcs":"SYSTEM_THRUSTER_MA150HO"
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{
			"capacity":200.0, 
			"power":200.0
		}, 
		"weaponSlot": {
			"mainLeft":{"type":"SYSTEM_SALVAGE_ARM"},
			"mainRight":{"type":"SYSTEM_SALVAGE_ARM"},
			"middleLeft":{"type":"SYSTEM_PDMWG"},
			"middleRight":{"type":"SYSTEM_PDMWG"},
			"leftBay1":{"type":"SYSTEM_NONE"}, 
			"rightBay1":{"type":"SYSTEM_NONE"},
			"leftBayRev1":{"type":"SYSTEM_NONE"}, 
			"rightBayRev1":{"type":"SYSTEM_NONE"},
		},
	}},
	"OCP-209-Snap": {"config": {
		"ammo":{
			"capacity":0.0, 
			"initial":0.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK1"
		},  
		"capacitor":{
				"capacity":1000.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_MPU",
			"modifierAmorphic":"SYSTEM_CARGO_MOD_2K"
		},
		"drones":{
			"initial":0.0, 
			"capacity":0.0, 
		}, 
		"fuel":{
			"capacity": 80000.0, 
			"initial": 80000.0, 
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_K44", 
			"rcs":"SYSTEM_THRUSTER_MA150HO"
		}, 
		"reactor":{	"power": 16.0},
		"turbine":{
			"capacity":200.0, 
			"power":200.0
		}, 
		"weaponSlot": {
			"mainLeft":{"type":"SYSTEM_SALVAGE_ARM"},
			"mainRight":{"type":"SYSTEM_SALVAGE_ARM"},
			"middleLeft":{"type":"SYSTEM_PDMWG"},
			"middleRight":{"type":"SYSTEM_PDMWG"},
			"leftBay1":{"type":"SYSTEM_NONE"}, 
			"rightBay1":{"type":"SYSTEM_NONE"},
			"leftBayRev1":{"type":"SYSTEM_NONE"}, 
			"rightBayRev1":{"type":"SYSTEM_NONE"},
		},
	}},
	"Tsukuyomi-Decom": {"config": {
		"ammo":{
			"capacity":5000.0, 
			"initial":5000.0, 
		}, 
		"autopilot":{
			"type":"SYSTEM_AUTOPILOT_MK2"
		}, 
		"capacitor":{
				"capacity":1000.0
		}, 
		"cargo":{
			"equipment":"SYSTEM_CARGO_STANDARD",
			"aux":"SYSTEM_NONE",
			"modifierDivided":"SYSTEM_CARGO_MOD_2K"
		},
		"drones":{
			"initial":0.0, 
			"capacity":0.0, 
		}, 
		"fuel":{
			"capacity":200000.0, 
			"initial":200000.0
		}, 
		"propulsion":{
			"main":"SYSTEM_MAIN_ENGINE_NDNTR", 
			"rcsLarge":"SYSTEM_MAIN_ENGINE_NDNTR"
		}, 
		"reactor":{"power":20.0}, 
		"shielding":{"emp":0.0}, 
		"turbine":{
			"capacity":500.0, 
			"power":500.0
		}, 
		"weaponSlot":{
			"mainLeft":{"type":"SYSTEM_NONE"}, 
			"mainRight":{"type":"SYSTEM_NONE"}, 
			"tubeLeftUp":{"type":"SYSTEM_NONE"}, 
			"tubeRightUp":{"type":"SYSTEM_NONE"}, 
			"tubeLeftDn":{"type":"SYSTEM_NONE"}, 
			"tubeRightDn":{"type":"SYSTEM_NONE"}, 
			"turretLeft":{"type":"SYSTEM_NONE"}, 
			"turretRight":{"type":"SYSTEM_NONE"},
			"leftBay2":{"type":"SYSTEM_NONE"}, 
			"rightBay2":{"type":"SYSTEM_NONE"},
			"leftBay3":{"type":"SYSTEM_NONE"}, 
			"rightBay3":{"type":"SYSTEM_NONE"},
		},
	}},
}

var shipConfigsUsed = {
	"Cothon-Lux": [
		{
			"weaponSlot":{
				"left":{"type":"SYSTEM_MWG"},
				"right":{"type":"SYSTEM_MWG"},
			},
			"ammo":{
				"capacity": 0,
				"initial": 0,
			}
		}, {
			"weaponSlot":{
				"left":{"type":"SYSTEM_PDMWG"},
				"right":{"type":"SYSTEM_PDMWG"}, 
			},
			"ammo":{
				"capacity": 0,
				"initial": 0,
			}
		}, {
			"weaponSlot":{
				
			},
		}
	],
	"MAD-CERF-Civ": [
		
	],
	"Oberon": [
		
	],
	"OCP-209-DD": [
		
	],
	"OCP-209-Snap": [
		
	],
	"Tsukuyomi-Decom": [
		{
			"weaponSlot": {
				"turretLeft":"SYSTEM_PDMWG",
				"turretRight":"SYSTEM_PDMWG"
			},
			"cargo": {
				"equipment":"SYSTEM_CARGO_MPUFSO",
				"aux":"SYSTEM_CARGO_AUX_PREPROC_A"
			}
		}
	],
}

var phantomVars = {
	# magazines
	"ammoValue": {
		200: 500,
	},
	# rods
	"rodsValue": {
		1.0: 20000,
	},
	"rodsMass": {
		1.0: 400,
	},
	# capacitors
	"capacitorValue": {
		100.0: 4000,
		700.0: 135000,
		1400.0: 292000,
	},
	"capacitorMass": {
		100.0: 400,
		700.0: 1800,
		1400.0: 3200,
	},
	# turbines
	"turbineValue": {
		20.0: 2500,
		160.0: 95000,
		320.0: 200000,
	},
	"turbineMass": {
		20.0: 100,
		160.0: 600,
		320.0: 1200,
	},
}
func _ready():
	for key in hardOverrides.keys():
		ships[key] = hardOverrides[key]
	
	# add phantomVars
	for key in phantomVars.keys():
		var varToChange = get(key)
		
		varToChange.merge(phantomVars[key])
		
	for key in shipReplacementPaths.keys():
		var replacementShip = load("res://%s/ships/%s.tscn" %
			[modName, shipReplacementPaths[key]]
		)
		ships[key] = replacementShip.duplicate()
	
	
	for key in newShipNames.keys():
		# make sure we're not accidentally overriding the... hard override. lol
		if not (key in hardOverrides.keys()):
			# get the ship from the files
			ships[key] = load("res://%s/ships/%s.tscn" % [modName, key])
		# set the model alias
		configAlias[key] = newShipNames[key]
		# create a new defaultShipConfig
		defaultShipConfig[key] = shipConfigs[key]
		# add a new array
		usedShipConfigs[key] = []
		# recursively add more usedConfigs with the base one
		for usedConfig in shipConfigsUsed[key]:
			var newUsedConfig = duplicate(shipConfigs[key])
			for usedKey in usedConfig.keys():
				# set the key value in the newUsedConfig
				newUsedConfig["config"][usedKey] = usedConfig[usedKey]
			# add it to the end of the array
			usedShipConfigs[key].append(newUsedConfig)
