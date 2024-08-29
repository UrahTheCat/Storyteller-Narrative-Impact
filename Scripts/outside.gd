extends Node2D

@onready var esc_to_quit: Area2D = $"Esc to quit"


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.html("#285cc4"))

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_esc_to_quit_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		print("dddddddddd")
		Transition.transition()
		await Transition.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/end.tscn")
		RenderingServer.set_default_clear_color(Color.BLACK)
		
