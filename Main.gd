extends Node
const cat_scene = preload("res://objs/Cat.tscn")

var curr_level = 0
var curr_lvl_obj
var current_level_tile_list

func init_level(curr_level_scene):
	curr_lvl_obj = curr_level_scene.instance()
	add_child(curr_lvl_obj)
#	cat.position = start_pos
	current_level_tile_list = curr_lvl_obj.get_node("TileSpawner").get_children()
	var temp_list = []
	for X in current_level_tile_list:
		if X.get_class() != "Sprite":
			temp_list.append(X)
	current_level_tile_list = temp_list
	
func load_next_level():
	curr_level = curr_level + 1
	load_level()

func load_level():
#	var arr = get_tree().get_root().get_node("Main").get_children()
#	for i in arr:
#		print(i.get_name())
	remove_child(curr_lvl_obj)

	var level_num = curr_level
	if level_num == 0:
		init_level(preload("res://levels/level0.tscn"))
	if level_num == 1:
		init_level(preload("res://levels/level1.tscn"))
	if level_num == 2:
		init_level(preload("res://levels/level2.tscn"))


func _ready():
#	init_cat()
	var curr_level_scene = preload("res://levels/level0.tscn")
	init_level(curr_level_scene)
#	curr_lvl_obj = curr_level_scene.instance()
#	add_child(curr_lvl_obj)


func _process(delta):
	if curr_lvl_obj.get_node("Cat").position.y -200 > get_viewport().get_visible_rect().end.y:
		load_level()
	if Input.is_key_pressed(KEY_R):
		load_level()

#		get_tree().reload_current_scene()
