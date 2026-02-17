extends Area2D
class_name walkeble_controller


func _on_walkeble_controller_area_entered(body):
	if body.is_in_group("tiles"):
		print("collide")
