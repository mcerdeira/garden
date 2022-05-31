extends Node
var guns_obj = preload("res://scripts/GunObj.gd")
export var EQUIPED_GUNS = []
var GUNS_DATA = null

func initialize():
	pass

func _ready():
	var file = File.new()
	if file.file_exists("guns_data.json"):
		file.open("guns_data.json", file.READ)
		var text = file.get_as_text()
		file.close()
		GUNS_DATA = parse_json(text)
		
	var g = guns_obj.new()
	g.initialize(GUNS_DATA.guns[0])
	EQUIPED_GUNS.append(g)
