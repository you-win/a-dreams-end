extends Node2D

var player : Node2D

onready var c2d : Camera2D = $Camera2D as Camera2D

func _ready():
	pass

func _process(delta: float) -> void:
	if player == null:
		player = find_node("Player")
	