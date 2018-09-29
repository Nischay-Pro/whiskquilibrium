extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
const current_level_scene = preload("res://levels/level0.tscn")
var current_level = current_level_scene.instance()

func _ready():
	get_tree().get_root().add_child(current_level)


#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
