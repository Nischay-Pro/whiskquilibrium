extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal next_level()

func _ready():
	var mainNode = get_tree().get_root().get_node("Main")
	self.connect("next_level", mainNode, "load_level")
	pass

func _process(delta):
	var arr = get_overlapping_bodies()
	for body in arr:
		if body.name == "Cat":
			print("INCAT")
			emit_signal("next_level")
