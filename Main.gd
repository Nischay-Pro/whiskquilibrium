extends Node

var curr_level = -1
var current_level_scene
var current_level_node
const cat_scene = preload("res://objs/Cat.tscn")
var cat = cat_scene.instance()
var start_pos = Vector2(0,0)

func init_cat():
	cat.position = start_pos
	add_child(cat)

func load_level():
	print("LOADED")
#	print(get_tree().get_root().get_children())
	var level = get_node("level_test")
	get_tree().get_root().remove_child(level)
	level.queue_free()
	var level_num = curr_level + 1
	if level_num == 0:
		start_pos = Vector2(256,200)
		init_cat()
		current_level_scene = preload("res://levels/level0.tscn")
		add_child(current_level_scene.instance())

#		get_tree().change_scene("res://levels/level0.tscn")
#	current_level_node = current_level_scene.instance()
#	add_child(current_level_node)

func _ready():
#	load_level(0)
	current_level_scene = preload("res://levels/level_test.tscn")
	add_child(current_level_scene.instance())
	init_cat()

func _process(delta):
	if cat.position.y > get_viewport().get_visible_rect().end.y:
		get_tree().reload_current_scene()
