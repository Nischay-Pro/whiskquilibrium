extends Node
const cat_scene = preload("res://objs/Cat.tscn")

var curr_level = -1
var curr_lvl_obj
var cat
var start_pos = Vector2(0,0)

func init_cat():
	cat = cat_scene.instance()
	cat.position = start_pos
	add_child(cat)

func init_level(curr_level_scene):
	curr_lvl_obj = curr_level_scene.instance()
	add_child(curr_lvl_obj)
	cat.position = start_pos

func load_level():
	var level = get_node("level_test")
#	var arr = get_tree().get_root().get_node("Main").get_children()
#	for i in arr:
#		print(i.get_name())
	get_tree().get_root().remove_child(curr_lvl_obj)
	level.queue_free()
	var level_num = curr_level + 1
	if level_num == 0:
		start_pos = Vector2(256,200)
		init_level(preload("res://levels/level0.tscn"))


func _ready():
	# start with level_test
	var curr_level_scene = preload("res://levels/level_test.tscn")
	curr_lvl_obj = curr_level_scene.instance()
	add_child(curr_lvl_obj)
	init_cat()

func _process(delta):
	if cat.position.y > get_viewport().get_visible_rect().end.y:
		get_tree().reload_current_scene()
