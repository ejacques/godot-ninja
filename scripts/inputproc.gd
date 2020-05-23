extends Node2D

onready var limit = get_node("Limit")
onready var inter = get_node("Inter")

var pressed = false
var drag = false
var curpos = Vector2(0, 0)
var prepos = Vector2(0, 0)

func _ready():
	pass
