extends Label



func _process(_delta):
	self.text = "GANCHO:" + String(Global.gancho) 
	print(self.text)
	
	if Global.Can_Gancho == true:
		add_color_override("font_color", Color(0,255,0))
		
	if Global.Can_Gancho == false:
		add_color_override("font_color", Color(255,0,0))
