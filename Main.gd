extends Node2D

var GodotBot = preload("res://GodotBot.tscn")

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		add_child(GodotBot.instance())
