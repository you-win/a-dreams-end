extends Node2D

export (PackedScene) var actor

func _ready():
	var instanced_actor = actor.instance()
	instanced_actor.set_pos(self.position)
	
	get_tree().root.add_child(instanced_actor)
