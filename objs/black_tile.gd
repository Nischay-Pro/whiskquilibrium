extends Node

var is_white = false

func _ready():
	get_node("WhiteSprite").hide()
	
func flip_color():
	is_white = not is_white
	if is_white:
		get_node("WhiteSprite").show()
		get_node("BlackSprite").hide()
	else:
		get_node("BlackSprite").show()
		get_node("WhiteSprite").hide()