extends "res://scripts/default-actor.gd"

onready var sprite : Sprite = $Sprite as Sprite
onready var cs2D : CollisionShape2D = $CollisionShape2D as CollisionShape2D
onready var asp2D : AudioStreamPlayer2D = $AudioStreamPlayer2D as AudioStreamPlayer2D

func _ready() -> void:
	._ready()
	
	
	# Player-specific logic
	
	# Nothing right now

func _process(delta : float) -> void:
	if Input.is_action_pressed("ui_up"):
		pass
	if Input.is_action_pressed("ui_down"):
		pass
	if Input.is_action_pressed("ui_left"):
		pass
	if Input.is_action_pressed("ui_right"):
		pass

func _physics_process(delta : float) -> void:
	
	pass
