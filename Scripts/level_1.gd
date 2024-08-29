extends Node2D

@onready var player: CharacterBody2D = $Player

@onready var level_1_start: Marker2D = $"Markers/Level 1 start"
@onready var level_2_start: Marker2D = $"Markers/Level 2 start"
@onready var level_3_start: Marker2D = $"Markers/Level 3 Start"
@onready var level_4_start: Marker2D = $"Markers/Level 4 Start"
@onready var level_5_start: Marker2D = $"Markers/Level 5 Start"

func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK);
	Global.level_1_start_pos = level_1_start.global_position
	Global.level_2_start_pos = level_2_start.global_position
	Global.level_3_start_pos = level_3_start.global_position
	Global.level_4_start_pos = level_4_start.global_position
	Global.level_5_start_pos = level_5_start.global_position
	
	player.global_position = Global.level_1_start_pos
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_level_1_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("aaaaaaaaaaaa")
		Transition.transition()
		await Transition.on_transition_finished
		player.global_position = Global.level_2_start_pos
		
func _on_level_2_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Transition.transition()
		await Transition.on_transition_finished
		player.global_position = Global.level_3_start_pos
		
func _on_level_3_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Transition.transition()
		await Transition.on_transition_finished
		player.global_position = Global.level_4_start_pos
		
func _on_level_4_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Transition.transition()
		await Transition.on_transition_finished
		player.global_position = Global.level_5_start_pos
		
func _on_level_5_end_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Transition.transition()
		await Transition.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/outside.tscn")
