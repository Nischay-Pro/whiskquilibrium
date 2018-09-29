extends Node

var current_level_scene
var current_level_node
const cat_scene = preload("res://objs/Cat.tscn")
var cat = cat_scene.instance()
var start_pos = Vector2(0,0)

func init_cat():
	cat.position = start_pos
	add_child(cat)

func load_level(level_num):
	if level_num == 0:
		current_level_scene = preload("res://levels/level0.tscn")
		start_pos = Vector2(256,200)
	current_level_node = current_level_scene.instance()
	add_child(current_level_node)

func _ready():
	load_level(0)
	init_cat()

func _process(delta):
	if cat.position.y > get_viewport().get_visible_rect().end.y:
		get_tree().reload_current_scene()
