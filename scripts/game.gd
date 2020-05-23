extends Node2D

onready var fruits = get_node("Fruits")

var pear = preload("res://scenes/pear.tscn")
var orange = preload("res://scenes/pear.tscn")

func _ready():
	pass


func _on_Generator_timeout():
	for i in range(0, rand_range(1, 4)):
		var type = int(rand_range(0,2))
		var obj
		if type == 0:
			obj = pear.instance()
		elif type == 1:
			obj = orange.instance()
		else:
			print("Oops - type")
			return
		
		obj.born(Vector2(rand_range(200, 1080), 800))
		
		fruits.add_child(obj)
