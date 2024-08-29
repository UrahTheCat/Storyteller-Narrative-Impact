extends Control

@onready var back: Button = $Back

func _ready() -> void:
	back.grab_focus()
	RenderingServer.set_default_clear_color(Color.BLACK);


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
