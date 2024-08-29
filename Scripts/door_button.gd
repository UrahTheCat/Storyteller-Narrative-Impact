extends Area2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var button_number = 0

func _process(delta: float) -> void:
	
	if Global.button_interaction_send:
		print("DAN", Global.door_activation_number)
		Global.door_activate = true
		Global.button_interaction_send = false
		audio_stream_player_2d.play()
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.button_col = true
		Global.door_activation_number = button_number
		print("heloooooooooooo")
		print("button is ", button_number)

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.button_col = false
		Global.door_activation_number = 0
		print("bye")
