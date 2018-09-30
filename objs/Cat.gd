extends KinematicBody2D

onready var active_cat_sprite = get_node("blackcat_sprite")
onready var inactive_cat_sprite = get_node("whitecat_sprite")

const UP = Vector2(0, -1)
const GRAVITY  = 20
const MOV_MOTION = 500
const JUMP_HEIGHT = -500
const BLACK_CAT = 0
const WHITE_CAT = 1

var cat_state = BLACK_CAT
var anim = "idle"

# Floating mechanics
var float_count = 20
var float_triggered = false
signal floatCat

# Switch mechanics
var switch_count = 20
signal switchCat
var switch_words = ["Kill me senpai", "I can't switch bitch!", "Nada", "Nope!", "Uh Huh"]


# Input booleans
var right_pressed = false
var left_pressed = false
var jump_pressed = false

var motion = Vector2()

func _ready():
	active_cat_sprite.show()
	inactive_cat_sprite.hide()
	_on_Cat_switchCat(true)
	emit_signal("floatCat")

func horizontal_physics():
	if right_pressed:
		motion.x = MOV_MOTION
	elif left_pressed:
		motion.x = -MOV_MOTION
	else:
		motion.x = 0
	if motion.x == 0:
		anim = "idle"
	else:
		anim = "run"
	if motion.x < 0 and scale == Vector2(1, 1):
		apply_scale(Vector2(-1, 1))
	elif motion.x > 0 and scale != Vector2(1, 1):
		apply_scale(Vector2(-1, 1))

func black_cat_physics():
	if is_on_floor():
		if jump_pressed:
			motion.y = JUMP_HEIGHT
	motion.y += GRAVITY

func white_cat_physics():
	if float_triggered and float_count > 0:
		motion.y = 0
	else:
		motion.y += GRAVITY
		
func cat_speak(text):
	get_node("./Speak").say(text)

func toggle_cat_state():
	if switch_count != 0:
		# Check for overlap with tiles
		for tile_node in get_parent().current_level_tile_list:
			var distance_from_tile = tile_node.global_position.distance_to(self.global_position)
			if distance_from_tile < 50:
				cat_speak("Can't switch states inside a block")
				return
		# Toggle cat_state
		if cat_state == WHITE_CAT:
			cat_state = BLACK_CAT
		elif cat_state == BLACK_CAT:
			cat_state = WHITE_CAT
		# Swap cat sprite nodes
		var temp_sprite = active_cat_sprite
		active_cat_sprite = inactive_cat_sprite
		inactive_cat_sprite = temp_sprite
		# Switch visibility of sprites
		active_cat_sprite.show()
		inactive_cat_sprite.hide()
		emit_signal("switchCat")
	else:
		cat_speak(switch_words[randi() % switch_words.size()])

func toggle_float():
	float_triggered = not float_triggered
	
func check_inputs():
	right_pressed = Input.is_action_pressed("ui_right")
	left_pressed = Input.is_action_pressed("ui_left")
	jump_pressed = Input.is_action_just_pressed("ui_up")
	if Input.is_action_just_pressed("switch_cat_state"):
		toggle_cat_state()
		if cat_state == BLACK_CAT and float_triggered:
			toggle_float()
	if Input.is_action_just_pressed("trigger_float") and cat_state == WHITE_CAT:
		toggle_float()
		emit_signal("floatCat")

func play_animation():
	active_cat_sprite.play(anim)
	inactive_cat_sprite.play(anim)

func _physics_process(delta):
	check_inputs()
	play_animation()
	if cat_state == BLACK_CAT:
		black_cat_physics()
	elif cat_state == WHITE_CAT:
		white_cat_physics()
	horizontal_physics()
	motion = move_and_slide(motion, UP)			

func _on_Cat_switchCat(default = false):
	if default == false:
		switch_count -= 1
	get_node("/root/Main/Level0/CanvasLayer/GUI/MainBar/TransformBar/Background/TransformCount").adjust(switch_count, cat_state)


func _on_Cat_floatCat():
	get_node("/root/Main/Level0/CanvasLayer/GUI/MainBar/FloatBar/FloatCounter/Background/FloatCount").adjust(float_triggered)
