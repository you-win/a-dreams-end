extends Node2D

###
# Reads and serializes world map data to LevelGrid.gd
###

var level_grid : LevelGrid

func _ready() -> void:
	pass

# If no argument is passed, loads the builtin world map
func _init(map_to_load : String = "res://scenes/TestWorldMap.json") -> void:
	var file = File.new()
	file.open(map_to_load, File.READ)
	
	var json = file.get_as_text()
	
	var parsed_json : JSONParseResult = JSON.parse(json)
	
	# Should always return a dictionary
	if typeof(parsed_json.result) == TYPE_DICTIONARY:
		level_grid = _serialize_json_data(parsed_json.result)
		
	else:
		print("[ERROR] Improperly formatted map data.")

func _serialize_json_data(json : Dictionary) -> LevelGrid:
	
	return null
