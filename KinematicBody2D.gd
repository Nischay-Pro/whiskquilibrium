extends KinematicBody2D

onready var active_cat_sprite = get_node("whitecat_sprite")
onready var inactive_cat_sprite = get_node("blackcat_sprite")

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

	if get_node(".").position.y > get_viewport_rect().end.y:
		# Replace with a "reset-to-checkpoint" action later
		queue_free()
		return
	
	if(cat_status == 1):
		active_cat_sprite = get_node("blackcat_sprite")
		inactive_cat_sprite = get_node("whitecat_sprite")
	elif(cat_status == 0):
		active_cat_sprite = get_node("whitecat_sprite")
		inactive_cat_sprite = get_node("blackcat_sprite")
	inactive_cat_sprite.hide()
	active_cat_sprite.show()
	
	#for i in range(get_slide_count()):
		#print(get_slide_collision(i).collider.get_name() + str(i))
	
	# Gravity
	motion.y += GRAVITY # So every frame the gravity effect is included

	if Input.is_action_pressed("ui_right"):
		motion.x = MOV_MOTION
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOV_MOTION
	else:
		motion.x = 0
	
	if Input.is_action_just_pressed("cat_state_switch"):
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
	if motion.x < 0 and scale == Vector2(1, 1):
		apply_scale(Vector2(-1, 1))
	elif motion.x > 0 and scale != Vector2(1, 1):
		apply_scale(Vector2(-1, 1))
	active_cat_sprite.play(anim)
	inactive_cat_sprite.play(anim)


