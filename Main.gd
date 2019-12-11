extends Node2D

var Bucket = preload("res://Bucket.tscn")

var current = {}

func _input(event):
	if event is InputEventScreenTouch and event.is_pressed():
		var i = Bucket.instance()
		i.position = event.position
		current[event.index] = i
		add_child(i)
	if event is InputEventScreenTouch and not event.is_pressed() and current.has(event.index):
		current[event.index].queue_free()
		current.erase(event.index)
	if event is InputEventScreenDrag and current.has(event.index):
		current[event.index].position = current[event.index].position + event.relative
