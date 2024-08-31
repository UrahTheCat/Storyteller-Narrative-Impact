extends Control

@onready var start: Button = $HBoxContainer/Start
@onready var sprite_2d: Sprite2D = $Sprite2D

var game_select = 0
var cheats_enabled = false

func _ready() -> void:
	start.grab_focus()
	RenderingServer.set_default_clear_color(Color.BLACK);
	sprite_2d.hide()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
			get_tree().quit()
	if cheats_enabled:
		if Input.is_action_just_pressed("selection_1"):
			game_select = 1
			print(game_select)
			sprite_2d.set_frame(1)
		elif Input.is_action_just_pressed("selection_2"):
			game_select = 2
			print(game_select)
			sprite_2d.set_frame(2)
		elif Input.is_action_just_pressed("selection_3"):
			game_select = 3
			print(game_select)
			sprite_2d.set_frame(3)
		elif Input.is_action_just_pressed("selection_0"):
			game_select = 0
			print(game_select)
			sprite_2d.set_frame(0)
		
	if Input.is_action_just_pressed("cheats"): 
		if !cheats_enabled:
			sprite_2d.show()
			cheats_enabled = true
		else: 
			sprite_2d.hide()
			cheats_enabled = false

func _on_start_pressed() -> void:
	
	print(game_select)
	if game_select == 1:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
	elif game_select == 2:
		get_tree().change_scene_to_file("res://Scenes/Levels/level_no_story.tscn")
	elif game_select == 3:
		get_tree().change_scene_to_file("res://Scenes/test_world.tscn")
	

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
	
	
