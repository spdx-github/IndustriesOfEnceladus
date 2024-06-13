extends "res://ships/Front Bumper.gd"

export (bool) var removeThis = false

func _ready():
	if removeThis:
		Tool.remove(self)
