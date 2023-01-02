extends Label



func _process(_delta):
	self.text = String(Global.fases) + "/10"
	print(self.text)
