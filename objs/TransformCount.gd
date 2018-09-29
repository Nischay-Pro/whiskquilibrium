extends Label

var count = 20
var blackmode = preload("res://images/ui/transform_3.png")
var whitemode = preload("res://images/ui/transform_2.png")

func update(cat_status):
	get_node("../TransformCount").text = str(count)
	if cat_status == 0:
		get_node("../TransformImage").set_texture(blackmode)
	else:
		get_node("../TransformImage").set_texture(whitemode)

func _ready():
	update(0)
	
func reset():
	count = 0
	update(0)

func adjust(adjustment,cat_status):
	count = adjustment
	update(cat_status)

