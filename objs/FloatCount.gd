extends Label

#var count = 20
var activemode = preload("res://images/ui/float_active.png")
var inactivemode = preload("res://images/ui/float.png")

func update(float_triggered):
	#get_node("../TransformCount").text = str(count)
	if float_triggered == true:
		get_node("../FloatImage").set_texture(activemode)
	else:
		get_node("../FloatImage").set_texture(inactivemode)

func _ready():
	update(false)
	
func reset():
	update(false)

func adjust(float_triggered):
	update(float_triggered)

