extends Node

# using Za'krin's loader script - thank you!

# Set mod priority if you want it to load before/after other mods
const MOD_PRIORITY = 0

var _savedObjects = []

var modName = "[SPDX] Industries of Enceladus"
var modVersion = "0.25.1"
var modPath = ""

func _init(modLoader = ModLoader):
	Debug.l(modName + ": Initializing, version " + modVersion)

# Get current path of script
	modPath = get_script().resource_path.get_base_dir() + "/"

# Must load DLC early for it to properly function.
	loadDLC()
	
# inject generic hardware
	replaceScene("ships/modules/AuxSlot.tscn")
	replaceScene("ships/modules/TorchSlot.tscn")
	replaceScene("ships/modules/ThrusterSlot.tscn")
	replaceScene("enceladus/Upgrades/WeaponSlotUpgrade.tscn")
	
# install the CargoScanner extension
	#installScriptExtension("hud/CargoScanner.gd")
# install the MineralProcessingUnit extension
	installScriptExtension("ships/modules/MineralProcessingUnit.gd")
# install the SystemShipUpgradeUI extension
	installScriptExtension("enceladus/SystemShipUpgradeUI.gd")
# install drone-plant extension
	installScriptExtension("weapons/drone-plant.gd")

# replace the dealer
	replaceScene("enceladus/Dealer.tscn")

# these need to be replaced first since they use custom placements
	replaceScene("ships/Eagle-Prospector-Bald.tscn")
	replaceScene("ships/Eagle-Prospector-Fat.tscn")
	replaceScene("ships/Eagle-Prospector-Lux.tscn")
	replaceScene("ships/Eagle-Prospector-VP.tscn")
	replaceScene("ships/Eagle-Prospector.tscn")

# inject new hardware
	replaceScene("weapons/WeaponSlot.tscn")
	
# replace ship scenes
	replaceScene("ships/ATK225-B.tscn")
	replaceScene("ships/ATK225-R.tscn")
	replaceScene("ships/ATK225.tscn")
	
	replaceScene("ships/Cothon-CHK.tscn")
	replaceScene("ships/Cothon-Lnd.tscn")
	replaceScene("ships/Cothon-V.tscn")
	replaceScene("ships/Cothon.tscn")
	
	replaceScene("ships/EIME.tscn")
	
	replaceScene("ships/kitsune.tscn")
	
	replaceScene("ships/ocp-209.tscn")
	
	replaceScene("ships/RA-TRTL-K44.tscn")
	replaceScene("ships/RA-TRTL-LCB.tscn")
	replaceScene("ships/RA-TRTL-R.tscn")
	replaceScene("ships/RA-TRTL-T.tscn")
	replaceScene("ships/RA-TRTL.tscn")
	
# install Shipyard.gd
	installScriptExtension("ships/Shipyard.gd")
# install CurrentGame.gd
	installScriptExtension("CurrentGame.gd")
	
# replace upgrades
	replaceScene("enceladus/Upgrades.tscn")
	
# replace dialog scenes
	#replaceScene("comms/conversation/StandClearMyArea.tscn")
	#replaceScene("comms/conversation/CargoScoopFree.tscn")
	
# Load custom translations
	updateTL() 

	Debug.l(modName + ": Initialized")


func _ready():
	Debug.l(modName + ": Ready")


# Helper script to load translations, as the ModLoader one seemingly does not function.
# This is not a good function, but it works.
func updateTL(path:String = modPath + "i18n/translation.txt"):
	Debug.l(modName + ": Updating Translations")

	var tlFile = File.new()
	tlFile.open(path, File.READ)

	var translation = Translation.new()
	translation.locale = "en"

	while tlFile.get_position() < tlFile.get_len():
		var line = tlFile.get_line()
		var split = line.split("|", false)
		if split.size() == 2:
			# quick update to allow changes to base strings
			var key = split[0]
			var val = tr(split[1]).c_unescape()
			
			translation.add_message(key, val)
			Debug.l("Added translation %s" % key)

	TranslationServer.add_translation(translation)

	Debug.l(modName + ": Translations Updated")


# Instances Settings.gd, loads DLC, then frees the script.
func loadDLC():
	Debug.l(modName + ": Preloading DLC as workaround")
	var DLCLoader = load("res://Settings.gd").new()
	DLCLoader.loadDLC()
	DLCLoader.queue_free()
	Debug.l(modName + ": Finished loading DLC")


# Helper function to replace scenes
func replaceScene(path:String, oldPath:String = "none"):
	Debug.l("Updating scene: %s" % path)
	var newScene
	var oldScene

	if oldPath == "none":
		newScene = str(modPath + path)
		oldScene = str("res://" + path)

	else:
		newScene = path
		oldScene = oldPath

	var scene = load(newScene)
	scene.take_over_path(oldScene)
	_savedObjects.append(scene)
	Debug.l("Finished updating: %s" % oldScene)


# Helper function to extend scripts
func installScriptExtension(path:String , oldPath:String = "none"):
	var childPath = str(modPath + path)
	var childScript = ResourceLoader.load(childPath)

	childScript.new()

	var parentScript = childScript.get_base_script()
	var parentPath = parentScript.resource_path

	Debug.l("Installing script extension: %s <- %s" % [parentPath, childPath])

	childScript.take_over_path(parentPath)
