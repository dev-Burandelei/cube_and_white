extends Label


func _process(_delta):
	self.text = "DASH:" + str(Global.dash) 


	if Global.Can_Dash == true:
		add_color_override("font_color", Color(0,255,0))
		
	if Global.Can_Dash == false:
		add_color_override("font_color", Color(255,0,0))
