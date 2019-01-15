extends "res://scripts/default-actor.gd"

onready var sprite = $Sprite
onready var cs2D = $CollisionShape2D
onready var asp2D = $AudioStreamPlayer2D

func _ready():
	._ready()
	
	# Player-specific logic
	
	# Nothing right now

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		pass
	if Input.is_action_pressed("ui_down"):
		pass
	if Input.is_action_pressed("ui_left"):
		pass
	if Input.is_action_pressed("ui_right"):
		pass

func _physics_process(delta):
	
	pass
