extends KinematicBody2D

onready var cat_sprite = get_node("whitecat_sprite")


# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const UP = Vector2(0, -1) # PTSD from normal direction in project
const GRAVITY  = 20
const MOV_MOTION = 300
const JUMP_HEIGHT = -400

var cat_status = 0 
var anim = "idle"

var motion = Vector2()

func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	
	if(cat_status == 1):
		get_node("whitecat_sprite").hide()
		get_node("blackcat_sprite").show()
		cat_sprite = get_node("blackcat_sprite")
	elif(cat_status == 0):
			get_node("blackcat_sprite").hide()
			get_node("whitecat_sprite").show()
			cat_sprite = get_node("whitecat_sprite")
	
	
	# Gravity
	motion.y += GRAVITY # So every frame the gravity effect is included

	if Input.is_action_pressed("ui_right"):
		motion.x = MOV_MOTION
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOV_MOTION
	else:
		motion.x = 0
	
	if Input.is_key_pressed(65):
		if(cat_status == 0):
			cat_status = 1
		elif(cat_status == 1):
			cat_status = 0
	
	
	if is_on_floor():
		# print("On floor") # For debugging
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT;
		elif Input.is_key_pressed(32):
			motion.y = JUMP_HEIGHT
	
	motion = move_and_slide(motion, UP) # Up is up
	if motion.x == 0:
		anim = "idle"
	else:
		anim = "run"
	if motion.x < 0:
		cat_sprite.set_flip_h(false)
	elif motion.x > 0:
		cat_sprite.set_flip_h(true)
	cat_sprite.play(anim)
	pass


