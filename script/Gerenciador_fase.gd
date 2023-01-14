extends Sprite


var dictionary = {1: "res://Cenas/Teste.tscn", 2:"res://Cenas/fase_prototipo.tscn"}
var fases = dictionary.values()

func gerenciador():
	var p = fases.pop_at(1)
	print(p)
	var _aux = get_tree().change_scene(p)
	p = fases.pop_at(0)
	print(p)
	
	



func _on_Signal_fase_body_entered(_body):
	gerenciador()
