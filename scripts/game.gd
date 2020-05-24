extends Node2D

onready var fruits = get_node("Fruits")

var pear = preload("res://scenes/pear.tscn")
var orange = preload("res://scenes/pear.tscn")
var bomb = preload("res://scenes/bomb.tscn")

var score = 0
var lifes = 3

func _ready():
	pass

func _on_Generator_timeout():
	if lifes <= 0: return
	for i in range(0, rand_range(1, 4)):
		var type = int(rand_range(0,3))
		var obj
		if type == 0:
			obj = pear.instance()
		elif type == 1:
			obj = orange.instance()
		elif type == 2:
			obj = bomb.instance()
		else:
			print("Oops - type")
			return
		
		obj.born(Vector2(rand_range(200, 1080), 800))
		
		obj.connect("life", self, "dec_life")
		if type != 4:
			obj.connect("score", self, "inc_score")
		
		fruits.add_child(obj)
		
func dec_life():
	lifes -= 1
	if lifes == 0:
		print("Acabou o jogo")
		get_node("GameOverScreen").start()
		get_node("Control/Bomb1").set_modulate(Color(1, 0, 0))
		get_node("InputProc").acabou = true
	elif lifes == 1:
		get_node("Control/Bomb2").set_modulate(Color(1, 0, 0))
	elif lifes == 2:
		get_node("Control/Bomb3").set_modulate(Color(1, 0, 0))
		
	
	
func inc_score():
	if lifes == 0: return
	score += 1
	get_node("Control/Score").set_text(str(score))
