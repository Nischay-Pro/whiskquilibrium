extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var current_level_scene
const cat_scene = preload("res://objs/Cat.tscn")
var cat = cat_scene.instance()
var start_pos = Vector2(0,0)

func init_cat():
	cat.position = start_pos
	add_child(cat)

func load_level(level_num):
	if level_num == 0:
		current_level_scene = preload("res://levels/level0.tscn")
		start_pos = Vector2(200, 0)

func _ready():
	load_level(0)
	add_child(current_level_scene.instance())
	init_cat()

func _process(delta):
	if cat.position.y > get_viewport().get_visible_rect().end.y:
		cat.queue_free()
		cat = cat_scene.instance()
		init_cat()
	pass
