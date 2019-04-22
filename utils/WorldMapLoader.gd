extends Node2D

###
# Reads and serializes world map data to LevelGrid.gd
###

var level_grid : LevelGrid

func _ready() -> void:
	pass

# If no argument is passed, loads the builtin world map
func _init(map_to_load : String = "res://scenes/TestWorldMap.json") -> void:
	# Should always return a dictionary
	var parsed_json : JSONParseResult = JSON.parse(map_to_load)
	
	if typeof(parsed_json.result) == TYPE_DICTIONARY:
		level_grid = _serialize_json_data()
		
	else:
		print("[ERROR] Improperly formatted map data.")

func _serialize_json_data() -> LevelGrid:
	
	return null
