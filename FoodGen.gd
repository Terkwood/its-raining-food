extends Node2D

const INTERVAL = 0.5

const all_food = [
	preload("res://Apple.tscn"),
	preload("res://Avocado.tscn"),
	preload("res://BoarHead.tscn"),
	preload("res://CheeseWedge.tscn"),
	preload("res://Chicken.tscn"),
	preload("res://Cherry.tscn"),
	preload("res://Honey.tscn"),
	preload("res://Pineapple.tscn"),
	preload("res://Pretzel.tscn"),
	preload("res://PumpkinPie.tscn"),
	preload("res://Shrimp.tscn"),
	preload("res://SushiRoll.tscn"),
	preload("res://SushiRoll2.tscn"),
	preload("res://Turkey.tscn"),
	preload("res://Watermelon.tscn"),
]

var time = 0
var next = 0

var half_window_size_x = OS.get_window_size().x / 2.0

func _ready():
	position.x = half_window_size_x

func _physics_process(delta):
	time = time + delta
	if time >= next:
		var i = all_food[randi() % all_food.size()].instance()
		var pos_offset_x = randi() % int(half_window_size_x)
		if randi() % 2 < 1:
			pos_offset_x = pos_offset_x * -1
		i.position.x = pos_offset_x
		add_child(i)
		next = time + INTERVAL