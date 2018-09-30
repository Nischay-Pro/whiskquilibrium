extends Node

var current_level_scene
var current_level_node
var current_level_tile_list
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
	current_level_tile_list = current_level_node.get_node("TileSpawner").get_children()
	var temp_list = []
	for X in current_level_tile_list:
		if X.get_class() != "Sprite":
			temp_list.append(X)
	current_level_tile_list = temp_list
	add_child(current_level_node)

func _ready():
	load_level(0)
	init_cat()

func _process(delta):
	if cat.position.y > get_viewport().get_visible_rect().end.y:
		get_tree().reload_current_scene()
