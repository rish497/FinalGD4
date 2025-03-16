extends CharacterBody2D

const SPEED = 200.0
var jump_velocity = -400.0  # Initial jump velocity
@onready var camera = $Camera2D  # Reference to the Camera2D node
var base_zoom = Vector2(1.0, 1.0)  # Default zoom level
var zoom_factor = 0.002  # Adjust this to control zoom intensity
var ground_y = 0.0  # Store the ground position

func _ready():
	ground_y = position.y  # Save the starting Y position

func _physics_process(delta: float) -> void:
	# Add gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity  # Apply the current jump velocity
		jump_velocity = randf_range(-50.0, -1000.0)  # Keep the large range

	# Adjust camera zoom based on height difference
	var height_difference = ground_y - position.y  # How high the player has jumped
	var new_zoom = base_zoom + Vector2(1, 1) * height_difference * zoom_factor
	camera.zoom = new_zoom.clamp(Vector2(1, 1), Vector2(3, 3))  # Limit zoom range

	# Get input direction and handle movement.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
