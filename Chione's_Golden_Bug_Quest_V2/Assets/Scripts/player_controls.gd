extends CharacterBody2D
class_name PlayerControls

const jump_height: float = -450 # Jump height
const gravity: float = 20 # Gravity

const max_speed: float = 150 # Limits the speed
const acceleration: float = 10 # Makes the player slowly go faster
const friction: float = 10 # Ice physics

func _physics_process(delta):
	# Code to make left and right movement possible + friction
	var x_input: float = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var velocity_weight: float = delta * (acceleration if x_input else friction)
	velocity.x = lerp(velocity.x, x_input * max_speed, velocity_weight)
	# Code to make jumping possible
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_height
	if Input.is_action_pressed("move_down"):
		set_collision_mask_value(10, false)
	else:
		set_collision_mask_value(10, true)
	velocity.y += gravity
	move_and_slide()

func _input(event):
	# Variable jump height
	if event.is_action_released("jump") and velocity.y < 0.0:
		velocity.y *= 0.5
