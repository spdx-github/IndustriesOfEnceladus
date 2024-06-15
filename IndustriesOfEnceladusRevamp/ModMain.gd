extends Node

# using Za'krin's loader script - thank you!

# Set mod priority if you want it to load before/after other mods
const MOD_PRIORITY = 0

var _savedObjects = []

var modName = "[SPDX] Industries of Enceladus"
var modVersion = "1.2.2"
var modPath = ""

func _init(modLoader = ModLoader):
	Debug.l(modName + ": Initializing, version " + modVersion)

# Get current path of script
	modPath = get_script().resource_path.get_base_dir() + "/"

# Must load DLC early for it to properly function.
	loadDLC()
	
# install drone-plant.gd which adjusts drone tuning behaviour
	installScriptExtension("weapons/drone-plant.gd")
	
# replace slots for all our new equipment
	replaceScene("ships/modules/AuxSlot.tscn")
	replaceScene("ships/modules/ThrusterSlot.tscn")
	replaceScene("ships/modules/TorchSlot.tscn")
	replaceScene("weapons/WeaponSlot.tscn")
	
# replace the Upgrades.tscn containing equipment modifications
	replaceScene("enceladus/Upgrades.tscn")
# replace Dealer.tscn for our "promo images" (that i don't have lol)
	replaceScene("enceladus/Dealer.tscn")
	
# install the Shipyard.gd script extension, which loads replacements + new ships
	installScriptExtension("ships/Shipyard.gd")
	
# install CurrentGame.gd which loads new ships into the game
	installScriptExtension("CurrentGame.gd")
	
# Load custom translations
	updateTL("en") 

	Debug.l(modName + ": Initialized")


func _ready():
	Debug.l(modName + ": Ready")


# Helper script to load translations, as the ModLoader one seemingly does not function.
# This is not a good function, but it works.
func updateTL(locale:String, path:String = modPath + "i18n"):
	Debug.l(modName + ": Updating translations")

	# preprocess i18n directory files
	var operatingPath = "%s/%s/" % [path, locale]
	var dir = Directory.new()
	if dir.open(operatingPath) == OK:
		dir.list_dir_begin(true)
		
		var tlFile = File.new()
		var marchDone = false

		var translation = Translation.new()
		translation.locale = locale
		
		while not marchDone:
			var fileName = dir.get_next()
			
			if fileName:
				tlFile.open(operatingPath + fileName)
				
				Debug.l("%s: Loaded translation file %s" % [modName, fileName])
		
				while tlFile.get_position() < tlFile.get_len():
					var line = tlFile.get_line()
					var split = line.split("|", false)
					if split.size() == 2:
						var key = split[0]
						var val = tr(split[1]).c_unescape()
						
						translation.add_message(key, val)
						Debug.l("Added translation %s" % key)
				
				tlFile.close()
			else:
				marchDone = true
				break

		TranslationServer.add_translation(translation)
	else:
		Debug.l("%s: Error in loading translation files" % modName)

	Debug.l(modName + ": Translations updated")


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
