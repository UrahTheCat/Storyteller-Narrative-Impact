extends Node

@onready var textbox_scene = preload("res://Scenes/textbox.tscn")

var dialoge_line :Array = []
var current_line_index = 0

var textbox
var textbox_pos :Vector2

var is_dialogue_active = false
var can_advance_line = false

func start_dialogue(position :Vector2, lines :Array):
	if is_dialogue_active:
		return
	
	dialoge_line = lines
	textbox_pos = position
	_show_textbox()
	
	is_dialogue_active = true
	
func _show_textbox():
	textbox = textbox_scene.instantiate()
	textbox.finished_displaying.connect(_on_textbox_finished_displaying)
	get_tree().root.add_child(textbox)
	textbox.global_position = textbox_pos
	textbox.display_text(dialoge_line[current_line_index])
	can_advance_line = false

func _on_textbox_finished_displaying():
	can_advance_line = true
	
func _unhandled_input(event: InputEvent) -> void:
	if (
		event.is_action_pressed("interact") && 
		is_dialogue_active &&
		can_advance_line
	):
		textbox.queue_free()
		current_line_index += 1
		
		if current_line_index >= dialoge_line.size():
			is_dialogue_active = false
			current_line_index = 0
			return
			
		_show_textbox()
		
func stop_dialogue():
	is_dialogue_active = false
	current_line_index = 0
	if is_instance_valid(textbox):
		textbox.queue_free()
	return
