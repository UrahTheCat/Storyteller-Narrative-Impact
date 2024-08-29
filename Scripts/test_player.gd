extends CharacterBody2D

@onready var coyote_jump_timer: Timer = $CoyoteJumpTimer;
@onready var jump_buffer_timer: Timer = $JumpBufferTimer;
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D;
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D;
@onready var dash_sfx: AudioStreamPlayer2D = $Dash_sfx

@export var  Speed :float = 175.0;
@export var Jump_strength :float = -310.0;
@export var Acceleration :float = 850;
@export var Friction :float = 1100;
@export var Dash_speed : float = 500;


var dashing = false;
var can_dash = false;
var buffered_jump = false;


var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("left", "right");
	
	apply_gravity(delta);
	jump_handling(direction, Dash_speed);
	
	apply_acceleration(direction, Speed, Acceleration, delta);
	apply_friction(direction, Friction, delta);
	animate_player(direction);
	interaction_handling();
	
	#----------[Update movement]----------#
	var was_on_floor = is_on_floor();
	move_and_slide();
	
	#----------[Update coyote jump]----------#
	var just_left_floor = (was_on_floor and !is_on_floor() and velocity.y >= 0);
	if just_left_floor: coyote_jump_timer.start();


func apply_gravity(delta :float):
	if !is_on_floor():
		velocity.y += gravity * delta;
		animated_sprite_2d.play("fall");

func jump_handling(input: float, dash_spd :float) -> void:
	if is_on_floor() or coyote_jump_timer.time_left > 0.0:
		if Input.is_action_just_pressed("jump") or buffered_jump:
			velocity.y = Jump_strength;
			buffered_jump = false;
			can_dash = true; 
		dashing = false;
	if !is_on_floor():
		if Input.is_action_just_released("jump") and velocity.y < Jump_strength / 2:
			velocity.y = Jump_strength / 2;
		if Input.is_action_just_pressed("dash"):
			dashing = true;
			dash_sfx.play()
		
		if input and dashing and can_dash and coyote_jump_timer.time_left <= 0.0: 
			velocity.x = input * dash_spd;
			can_dash = false;
		
	if Input.is_action_just_pressed("jump"):
		buffered_jump = true;
		jump_buffer_timer.start()

func apply_friction(input :float, fric :float, delta :float) -> void:
	if input == 0:
		velocity.x = move_toward(velocity.x, 0, fric * delta);

func apply_acceleration(input :float, spd :float, acc :float, delta :float) -> void:
	velocity.x = move_toward(velocity.x, spd * input, acc * delta);

func animate_player(input: float) -> void:
	if velocity.x != 0:
		animated_sprite_2d.flip_h = (input < 0);
		animated_sprite_2d.play("run"); 
	else:
		animated_sprite_2d.play("idle");
	if !is_on_floor():
		if velocity.y < 0.0: 
			animated_sprite_2d.play("jump");
		elif velocity.y > 0.0:
			animated_sprite_2d.play("fall");

func _on_jump_buffer_timer_timeout() -> void:
	buffered_jump = false
	
func interaction_handling():
	var interacted = Input.is_action_just_pressed("interact")
	if Global.button_col: 
		if interacted && DialogueManager.is_dialogue_active == false:
			Global.button_interaction_send = true
			print("interacted")
			print("button id: ", Global.door_activation_number)
	
	
