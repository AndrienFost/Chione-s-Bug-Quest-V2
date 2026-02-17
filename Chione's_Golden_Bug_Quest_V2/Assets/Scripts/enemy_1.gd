extends CharacterBody2D

@export var collisoion_wall: CollisionShape2D

const SPEED = -50.0

var collision_cont = -1


func _physics_process(delta: float) -> void:
	#velocity.x = lerp(velocity.x, x_input * max_speed, velocity_weight)
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x = SPEED
	move_and_slide()


func _on_walkeble_controller_area_entered(body):
	if body.is_in_group("tiles"):
		print("Collided with a tile!")
