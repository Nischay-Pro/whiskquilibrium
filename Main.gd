extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var current_level_scene

func load_level(level_num):
	if level_num == 0:
		current_level_scene = preload("res://levels/level0.tscn")	

func _ready():
	load_level(0)
	add_child(current_level_scene.instance())


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
