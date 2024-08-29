extends Control

@onready var start: Button = $HBoxContainer/Start

func _ready() -> void:
	start.grab_focus()
	RenderingServer.set_default_clear_color(Color.BLACK);

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_start_pressed() -> void:
	var game_select = randi_range(1,2)
	print(game_select)
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
	
	
