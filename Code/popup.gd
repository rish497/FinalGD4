extends Node2D
@onready var window: Window = $Window
@onready var popup_scene: PackedScene = preload("res://scenes/Popup.tscn")  # Ensure correct path

func _ready() -> void:
	show_popup_randomly()  # Start popups

func show_popup_randomly() -> void:
	while true:
		var random_time = randf_range(30.0, 100.0)  # Random delay
		await get_tree().create_timer(random_time).timeout  # Wait

		if not popup_scene:
			print("ERROR: Failed to load popup scene!")
			return

		var popup_instance = popup_scene.instantiate()  # Create popup
		if not popup_instance:
			print("ERROR: Popup instance is null!")
			return
		
		add_child(popup_instance)  # Add to scene tree
		window.show()  # Display popup


func _on_window_close_requested() -> void:
	window.hide()
