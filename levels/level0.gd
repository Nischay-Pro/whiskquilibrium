extends Node

const cat_scene = preload("res://objs/Cat.tscn")
var cat = cat_scene.instance()

func init_cat():
	
	get_tree().get_root().get_node("Main").add_child(cat)

func _ready():
	init_cat()

func _process(delta):
	if cat.position.y > get_viewport().get_visible_rect().end.y:
		# Replace with a "reset-to-checkpoint" action later
		cat.queue_free()
		cat = cat_scene.instance()
		init_cat()