extends Control

onready var tie = get_node("Panel/TextContainer")

func narrate():
	tie.reset()
	tie.set_color(Color(1,1,1))
	tie.buff_text("Text me on Telegram bruh, ", 0.1)
	tie.buff_text("lalala\n", 0.2)
	tie.buff_silence(1)
	tie.buff_text("It is so beautiful, ", 0.1)
	tie.buff_text("lalala\n", 0.2)
	tie.buff_silence(1)
	tie.buff_text("I love this song, ", 0.1)
	tie.buff_text("lalala\n", 0.2)
	tie.buff_silence(1)
	tie.buff_text("But now I'll ", 0.1) # WAIT FOR THE DROP
	tie.buff_text("DROP", 0.02) # ?????
	tie.buff_silence(0.4)
	tie.buff_text(" THE BASS\n", 0.02) # !!!!!
	tie.buff_silence(0.4)
	tie.buff_text("TVUVTUVUTUVU WOODBODBOWBDODBO TUUVUTVU WODWVDOOWDV WODOWVOOWDVOWVD DUBDUBDUBUDUDB OWVDOWVWDOWVDOWVDOWVDWVDOWVDOWVODV", 0.04) # I firmly believe this particular verse is my Magna Opus.
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

