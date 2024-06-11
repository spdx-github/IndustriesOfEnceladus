extends "res://ships/Shipyard.gd"

var modName = "IndustriesOfEnceladusRevamp"

var shipPaths = {
	"AT225-B": "ATK225-B",
	"AT225-R": "ATK225-R",
	"AT225": "ATK225",
	"COTHON-CHK":"Cothon-CHK",
	"COTHON-LND":"Cothon-Lnd",
	"COTHON-V":"Cothon-V",
	"COTHON":"Cothon",
	"OCP209":"ocp-209",
	"PROSPECTOR-BALD": "Eagle-Prospector-Bald",
	"PROSPECTOR-FAT": "Eagle-Prospector-Fat",
	"PROSPECTOR-LUX": "Eagle-Prospector-Lux",
	"PROSPECTOR-VP": "Eagle-Prospector-VP",
	"PROSPECTOR": "Eagle-Prospector",
	"TRTL-44": "RA-TRTL-K44",
	"TRTL-LCB": "RA-TRTL-LCB",
	"TRTL-R": "RA-TRTL-R",
	"TRTL-T": "RA-TRTL-T",
	"TRTL": "RA-TRTL",
}

func _ready():
	for key in shipPaths.keys():
		var replacementShip = load("res://%s/ships/%s.tscn" %
			[modName, shipPaths[key]]
		)
		ships[key] = replacementShip.duplicate()
