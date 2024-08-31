extends Control

@onready var credit_timer: Timer = $"Credit Timer"
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	RenderingServer.set_default_clear_color(Color.BLACK)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _on_credit_timer_timeout() -> void:
	print("aaaaaaaaaaa")
	animation_player.play("end")
