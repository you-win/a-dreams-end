extends Node2D

export (PackedScene) var actor

func _ready():
	var instanced_actor = actor.instance()
	instanced_actor.position = self.position
	
	get_tree().root.call_deferred("add_child", instanced_actor)
