extends Node2D

const BLACK = 0
const WHITE = 1

var tile_state = BLACK
var cat_node = null
var tile_list = null

func _ready():
	get_node("BlackSprite").show()
	get_node("WhiteSprite").hide()
	cat_node = get_parent().get_parent().get_node("Cat")
	
func flip_color():
	if tile_state == BLACK:
		tile_state = WHITE
		get_node("WhiteSprite").show()
		get_node("BlackSprite").hide()
	else:
		tile_state = BLACK
		get_node("BlackSprite").show()
		get_node("WhiteSprite").hide()
		
func _process(delta):
	if cat_node.cat_state == tile_state:
		add_collision_exception_with(cat_node)
	else:
		remove_collision_exception_with(cat_node)