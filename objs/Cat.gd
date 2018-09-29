extends KinematicBody2D

onready var active_cat_sprite = get_node("whitecat_sprite")
onready var inactive_cat_sprite = get_node("blackcat_sprite")

const UP = Vector2(0, -1)
const GRAVITY  = 20
const MOV_MOTION = 500
const JUMP_HEIGHT = -500
const BLACK_CAT = 0
const WHITE_CAT = 1

var cat_status = BLACK_CAT
var anim = "idle"

var float_count = 20

var motion = Vector2()

func basic_physics(delta):	
	if cat_status == BLACK_CAT:
		active_cat_sprite = get_node("blackcat_sprite")
		inactive_cat_sprite = get_node("whitecat_sprite")
	elif cat_status == WHITE_CAT:
		active_cat_sprite = get_node("whitecat_sprite")
		inactive_cat_sprite = get_node("blackcat_sprite")
	inactive_cat_sprite.hide()
	active_cat_sprite.show()
	
	if Input.is_action_pressed("ui_right"):
		motion.x = MOV_MOTION
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOV_MOTION
	else:
		motion.x = 0
	
	if Input.is_action_just_pressed("cat_state_switch"):
		if cat_status == WHITE_CAT:
			cat_status = BLACK_CAT
		elif cat_status == BLACK_CAT:
			cat_status = WHITE_CAT
			
	motion = move_and_slide(motion, UP) # Up is up
	if motion.x == 0:
		anim = "idle"
	else:
		anim = "run"
	if motion.x < 0 and scale == Vector2(1, 1):
		apply_scale(Vector2(-1, 1))
	elif motion.x > 0 and scale != Vector2(1, 1):
		apply_scale(Vector2(-1, 1))
	active_cat_sprite.play(anim)
	inactive_cat_sprite.play(anim)

func black_cat_physics(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up") or Input.is_key_pressed(32):
			motion.y = JUMP_HEIGHT
	motion.y += GRAVITY

func white_cat_physics(delta):
	motion.y = 0

func _physics_process(delta):
	if cat_status == BLACK_CAT:
		black_cat_physics(delta)
	elif cat_status == WHITE_CAT:
		white_cat_physics(delta)
	basic_physics(delta)

