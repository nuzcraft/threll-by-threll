extends Node2D

var turn_taken: bool = false

func _process(delta: float) -> void:
	# player turn
	if Input.is_action_just_pressed("ui_accept"):
		turn_taken = true
	
	# enemy turn
	if turn_taken:
		for node in get_children():
			if node is Actor:
				#node.move(node.direction)
				node.die()
		turn_taken = false
		
		
