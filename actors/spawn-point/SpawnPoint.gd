extends Node2D

export (PackedScene) var actor : PackedScene

func _ready() -> void:
	var instanced_actor = actor.instance()
	instanced_actor.position = self.position
	
	get_parent().call_deferred("add_child", instanced_actor)
