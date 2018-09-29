extends Node

const cat_scene = preload("res://objs/Cat.tscn")
var cat = cat_scene.instance()

func init_cat():
	get_tree().get_root().add_child(cat)
	#cat

func _ready():
	init_cat()
	pass

func _process(delta):
	if cat.position.y > get_viewport().get_visible_rect().end.y:
		#print("oob")
		# Replace with a "reset-to-checkpoint" action later
		cat.queue_free()
		cat = cat_scene.instance()
		init_cat()
	pass