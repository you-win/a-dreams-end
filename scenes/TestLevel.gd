extends Node2D

var player

onready var c2d : Camera2D = $Camera2D as Camera2D

func _ready():
	pass

func _process(delta: float) -> void:
	if player == null:
		player = get_tree().root.find_node("Player", true, false)