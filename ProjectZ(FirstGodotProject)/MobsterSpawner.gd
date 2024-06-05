extends Node2D

@export var mobster_tscn: PackedScene

func mobster_spawn():
	var new_mobster = mobster_tscn.instantiate()
	add_sibling(new_mobster)
