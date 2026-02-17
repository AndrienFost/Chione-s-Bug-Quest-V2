extends Control

# Export paths for your area scenes
@export var area1_path: String
@export var area2_path: String
@export var area3_path: String

# Reference to the current area node
@onready var current_area: Node2D = $Area

# Reference to the player (optional)
@onready var player: CharacterBody2D = $Player

# Called when the node enters the scene tree for the first time
func _ready():
	# Load Area 1 by default
	current_area = load(area1_path).instantiate()
	add_child(current_area)

# Function to swap areas instantly
func swap_area(new_area_path: String):
	var new_area = load(new_area_path).instantiate()
	remove_child(current_area)
	current_area = new_area
	add_child(current_area)
	# Teleports player to specific location
	player.global_position = Vector2(20, 20)
	# Resets velocity
	player.velocity.y = 0
	player.velocity.x = 0

# Check for input action in _unhandled_input
func _unhandled_input(event):
	if event.is_action_pressed("test_input"):
		if current_area.scene_file_path == area1_path:
			swap_area(area2_path)
		else:
			swap_area(area1_path)
