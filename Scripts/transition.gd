extends CanvasLayer

signal on_transition_finished

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
 
func _ready() -> void:
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(animation_name):
	if animation_name == "fade_out":
		animation_player.play("fade_in")
		on_transition_finished.emit()
	elif animation_name == "fade_in":
		color_rect.visible = false

func transition():
	color_rect.visible = true
	animation_player.play("fade_out")
	
