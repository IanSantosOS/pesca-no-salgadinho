extends CharacterBody2D

const ACCELERATION = 1000.0
const FRICTION = 1000.0
const JUMP_VELOCITY = -300.0
const SPEED_WALK = 80.0
const SPEED_RUN = 115.0

var speed = SPEED_WALK
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	

	if !Dialogic.VAR.is_chatting:
		handle_jump()
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var input_axis := Input.get_axis("left", "right")

		handle_running()
		handle_acceleration(input_axis, delta)
		apply_friction(input_axis, delta)
		update_animations(input_axis)

	move_and_slide()

func apply_gravity(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta

func handle_jump():
	if is_on_floor():
		if Input.is_action_just_pressed("up"):
			velocity.y = JUMP_VELOCITY
	else:
		if velocity.y < (JUMP_VELOCITY / 2) and Input.is_action_just_released("up"):
			velocity.y = JUMP_VELOCITY / 2

func handle_acceleration(input_axis: float, delta: float):
	velocity.x = move_toward(velocity.x, speed * input_axis, ACCELERATION * delta)

func apply_friction(input_axis: float, delta: float):
	if input_axis == 0:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

func update_animations(input_axis: float):
	if input_axis != 0:
		animated_sprite_2d.flip_h = (input_axis < 0)
		animated_sprite_2d.play("run2")
	else:
		animated_sprite_2d.play("idle2")
	
	if not is_on_floor():
		animated_sprite_2d.play("jump")

func handle_running():
	if Input.is_action_pressed("run"):
		speed = SPEED_RUN
	elif Input.is_action_just_released("run"):
		speed = SPEED_WALK

func player():
	pass
