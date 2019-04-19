extends "res://utils/DefaultActor.gd"

class_name Player

# Signals

# Enums
enum sides {TOP, BOTTOM, LEFT, RIGHT}

# Variables
var player_input : Array = []
var linear_velocity : Vector2 = Vector2()
var is_grounded : bool = false
var is_touching_wall : bool = false
var target_speed : float = 0.0
var last_player_position : Vector2 = Vector2()

export var move_speed : float = 250.0
export var jump_speed : float = 300.0
export var wall_jump_h_speed : float = 400.0
export var h_acceleration : float = 0.1

onready var sprite : Sprite = $Sprite as Sprite
onready var cs2D : CollisionShape2D = $CollisionShape2D as CollisionShape2D
onready var asp2D : AudioStreamPlayer2D = $AudioStreamPlayer2D as AudioStreamPlayer2D
onready var vn2D : VisibilityNotifier2D = $VisibilityNotifier2D as VisibilityNotifier2D

func _ready() -> void:
	._ready()
	
	# Player-specific logic
	vn2D.connect("screen_exited", self, "_on_player_leaving_screen")
	
	# Nothing right now

func _process(delta : float) -> void:
	### Player Control ###
	player_input.clear()
	if Input.is_action_pressed("ui_up"):
		player_input.append(Constants.inputs_enum.UP)
	if Input.is_action_pressed("ui_down"):
		player_input.append(Constants.inputs_enum.DOWN)
	if Input.is_action_pressed("ui_left"):
		player_input.append(Constants.inputs_enum.LEFT)
	if Input.is_action_pressed("ui_right"):
		player_input.append(Constants.inputs_enum.RIGHT)

func _physics_process(delta : float) -> void:
	### Movement ###
	
	# Physics
	linear_velocity += delta * Constants.GRAVITY_VECTOR
	
	linear_velocity = move_and_slide(linear_velocity, Constants.FLOOR_NORMAL, Constants.SLOPE_SLIDE_STOP)
	
	is_grounded = is_on_floor()
	is_touching_wall = is_on_wall()
	
	# Horizontal
	target_speed = 0
	if player_input.has(Constants.inputs_enum.LEFT):
		target_speed -= 1
	if player_input.has(Constants.inputs_enum.RIGHT):
		target_speed += 1
	
	target_speed *= move_speed
	linear_velocity.x = lerp(linear_velocity.x, target_speed, h_acceleration)
	
	# Vertical
	if(is_grounded and player_input.has(Constants.inputs_enum.UP)):
		linear_velocity.y = -jump_speed
	elif(is_touching_wall and player_input.has(Constants.inputs_enum.UP)):
		linear_velocity.y = -jump_speed
		var wall_position_x = get_slide_collision(0).position.x
		if wall_position_x > self.global_position.x:
			linear_velocity.x -= wall_jump_h_speed
		elif wall_position_x < self.global_position.x:
			linear_velocity.x += wall_jump_h_speed
	elif(linear_velocity.y < 0 and !player_input.has(Constants.inputs_enum.UP)):
		linear_velocity.y *= 0.5
	
	### Animation ###
	
	# Flip the sprite
	if is_grounded:
		if linear_velocity.x < -Constants.H_ANIM_CHANGE:
			sprite.flip_h = true
		if linear_velocity.x > Constants.H_ANIM_CHANGE:
			sprite.flip_h = false

func _on_player_leaving_screen() -> void:
	var next_map_direction : Array = []
	last_player_position = self.global_position
	if last_player_position.x > 0:
		next_map_direction.append(sides.RIGHT)
	elif last_player_position.x < 0:
		next_map_direction.append(sides.LEFT)
	if last_player_position.y < 0:
		next_map_direction.append(sides.TOP)
	elif last_player_position.y > 0:
		next_map_direction.append(sides.BOTTOM)
	# TODO need logic for map switching, probably will need some sort of table 
	# structure and then just search based off the enums
