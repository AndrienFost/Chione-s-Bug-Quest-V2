extends Node2D

@export var player_controls : PlayerControls
@export var player_animation : AnimationPlayer
@export var sprite : Sprite2D

func _process(delta):
	var direction = Input.get_axis("move_right", "move_left")
	var one = 1 + (0 * delta)
	# Flip the sprite based on direction
	if direction > 0:
		$Sprite2D.scale.x = one # Face right (default)
	elif direction < 0:
		$Sprite2D.scale.x = -one  # Face left
	# Plays the walking/idle animations
	if abs(player_controls.velocity.x) > 15.0:
		player_animation.play("Walk")
	else:
		player_animation.play("Idle")
	# Plays the jumping/falling animations
	if player_controls.velocity.y < 0.0:
		player_animation.play("Jump")
	elif player_controls.velocity.y > 0.0:
		player_animation.play("Fall")
