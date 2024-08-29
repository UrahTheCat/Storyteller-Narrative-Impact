extends StaticBody2D
class_name door

@export var door_number = 0

var slide_up = 32
var can_open = true

func _process(delta: float) -> void:
	if Global.door_activate && door_number == Global.door_activation_number:
		Global.door_activate = false
		open(delta)

func open(delta):
	if can_open: 
		self.global_position.y = global_position.y - slide_up
	can_open = false
		
