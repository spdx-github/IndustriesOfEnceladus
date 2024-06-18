extends Node

# using Za'krin's loader script - thank you!

# Set mod priority if you want it to load before/after other mods
const MOD_PRIORITY = 0

var _savedObjects = []

var modName = "[SPDX] Industries of Enceladus"
var modVersion = "1.3.2"
var modPath = ""
var configFile:ConfigFile = ConfigFile.new()

var aesthetics:bool = true
var addShips:bool = true
var verbose:bool = true # failsafe

func _init(modLoader = ModLoader):
	sLog("Initialising! Version %s" % modVersion)

# Get current path of script
	modPath = get_script().resource_path.get_base_dir()
	
	# config file loader
	if configFile.load("%s.ini" % modPath) == OK:
		aesthetics = configFile.get_value("General", "aesthetic-stuff")
		addShips = configFile.get_value("General", "add-new-ships")
		verbose = configFile.get_value("Debug", "verbose")
	else:
		sLog("ERROR! Couldn't load config file, falling back on default values")
	
	# needed since this is stupid
	modPath += "/"

# Must load DLC early for it to properly function.
	loadDLC()
	
# replace slots for all our new equipment
	replaceScene("ships/modules/AuxSlot.tscn")
	replaceScene("ships/modules/ThrusterSlot.tscn")
	replaceScene("ships/modules/TorchSlot.tscn")
	
# replace weapons and WeaponSlot
	if aesthetics:
		sLog("Setting up aesthetic adjustments")
		replaceScene("weapons/railgun_tor.tscn")
		
	replaceScene("weapons/WeaponSlot.tscn")
	
# install the Shipyard.gd script extension, which loads replacements + new ships
	installScriptExtension("ships/Shipyard.gd")
# install CurrentGame.gd which loads new ships into the game
	if addShips:
		sLog("Injecting new ships")
		installScriptExtension("CurrentGame.gd")
	
# replace the Upgrades.tscn containing equipment modifications
	replaceScene("enceladus/Upgrades.tscn")
# replace Dealer.tscn for our "promo images" (that i don't have lol)
	if addShips:
		replaceScene("enceladus/Dealer.tscn")
	
# Load custom translations
	updateTL("en") 

	sLog("Initialised!")


func _ready():
	sLog("Ready!")


# Helper script to load translations, as the ModLoader one seemingly does not function.
# This is not a good function, but it works.
func updateTL(locale:String, path:String = modPath + "i18n"):
	sLog("Updating translations")

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
				
				if verbose: sLog("Loaded translation file %s" % fileName)
		
				while tlFile.get_position() < tlFile.get_len():
					var line = tlFile.get_line()
					var split = line.split("|", false)
					if split.size() == 2:
						var key = split[0]
						var val = tr(split[1]).c_unescape()
						
						translation.add_message(key, val)
						if verbose: Debug.l("Added translation %s" % key)
				
				tlFile.close()
			else:
				marchDone = true
				break

		TranslationServer.add_translation(translation)
	else:
		sLog("ERROR! Couldn't find path '%s'!" % operatingPath)

	sLog("Translations updated")


# Instances Settings.gd, loads DLC, then frees the script.
func loadDLC():
	sLog("Preloading DLC")
	var DLCLoader = load("res://Settings.gd").new()
	DLCLoader.loadDLC()
	DLCLoader.queue_free()
	sLog("Finished loading DLC")


# Helper function to replace scenes
func replaceScene(path:String, oldPath:String = "none"):
	if verbose: sLog("Updating scene %s" % path)
	
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
	
	if verbose: sLog("Updated %s" % path)

# Helper function to extend scripts
func installScriptExtension(path:String , oldPath:String = "none"):
	var childPath = str(modPath + path)
	var childScript = ResourceLoader.load(childPath)

	childScript.new()

	var parentScript = childScript.get_base_script()
	var parentPath = parentScript.resource_path

	if verbose: sLog("Installing script extension (%s <- %s)" % [parentPath, childPath])

	childScript.take_over_path(parentPath)

# quick helper for Debug.l "soft log"
func sLog(text:String):
	Debug.l("%s: %s" % [modName, text])
