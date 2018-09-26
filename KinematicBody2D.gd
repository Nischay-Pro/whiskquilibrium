extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

const UP = Vector2(0, -1) # PTSD from normal direction in project
const GRAVITY  = 20
const MOV_MOTION = 100
const JUMP_HEIGHT = -400

var motion = Vector2()

func _physics_process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.

	# Gravity
	motion.y += GRAVITY # So every frame the gravity effect is included

	if Input.is_action_pressed("ui_right"):
		motion.x = MOV_MOTION
	elif Input.is_action_pressed("ui_left"):
		motion.x = -MOV_MOTION
	else:
		motion.x = 0
	
	if is_on_floor():
		# print("On floor") # For debugging
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT;
	
	motion = move_and_slide(motion, UP) # Up is up
	pass

# func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	# pass


