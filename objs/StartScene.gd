extends Control

onready var tie = get_node("Panel/TextContainer")

func narrate():
	tie.reset()
	tie.set_color(Color(1,1,1))
	tie.buff_text("\n\n", 0.01)
	tie.buff_text("Schrodinger was up to his\n", 0.06)
	tie.buff_text("old tricks once again.\n", 0.06)
	tie.buff_silence(0.5)
	tie.buff_text("\n\nBut his cat?\n", 0.04)
	tie.buff_text("Well, she had had enough.\n\n\n", 0.04)
	tie.buff_silence(0.5)
	tie.buff_text("And now it was time\n", 0.06)
	tie.buff_text("for her to leave.\n", 0.06)
	tie.buff_silence(1)
	tie.set_state(tie.STATE_OUTPUT)

func _ready():
	tie.connect("input_enter", self, "_on_input_enter")
	tie.connect("buff_end", self, "_on_buff_end")
	tie.connect("state_change", self, "_on_state_change")
	tie.connect("enter_break", self, "_on_enter_break")
	tie.connect("resume_break", self, "_on_resume_break")
	tie.connect("tag_buff", self, "_on_tag_buff")
	narrate()
	
func _on_input_enter(s):
	print("Input Enter ",s)
	
	tie.add_newline()
	tie.buff_text("Oooh, so your name is " + s + "? What a beautiful name!", 0.01)
	pass

func _on_buff_end():
	print("Buff End")
	pass

func _on_state_change(i):
	print("New state: ", i)
	pass

func _on_enter_break():
	print("Enter Break")
	pass

func _on_resume_break():
	print("Resume Break")
	pass

func _on_tag_buff(s):
	print("Tag Buff ",s)
	pass

