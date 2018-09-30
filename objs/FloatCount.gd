extends Label

#var count = 20
var float_count = 20
var activemode = preload("res://images/ui/float_active.png")
var inactivemode = preload("res://images/ui/float.png")

func update(float_triggered):
	#get_node("../TransformCount").text = str(count)
	if float_triggered == true:
		get_node("../FloatImage").set_texture(activemode)
	else:
		get_node("../FloatImage").set_texture(inactivemode)
		
func updateProgress(float_count):
	get_node("../../../FloatProgress").value = int(float_count)
	
func setProgressMax(max_count):
	get_node("../../../FloatProgress").max_value = int(max_count)

func _ready():
	update(false)
	setProgressMax(100)
	updateProgress(0)
	
func reset():
	update(false, float_count)
	setProgressMax(100)
	updateProgress(0)

func adjust(float_triggered, float_count, max_float_count):
	update(float_triggered)
	setProgressMax(max_float_count)
	updateProgress(float_count)

