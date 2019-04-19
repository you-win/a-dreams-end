extends Node2D

# Enums
enum inputs_enum {NONE, UP, DOWN, LEFT, RIGHT}

# Constants
const GRAVITY_VECTOR : Vector2 = Vector2(0, 500)
const FLOOR_NORMAL : Vector2 = Vector2(0, -1)
const SLOPE_SLIDE_STOP : float = 10.0
const MIN_AIR_TIME : float = 0.1
const H_ANIM_CHANGE : float = 10.0