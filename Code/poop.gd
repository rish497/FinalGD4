extends Node2D

@export var spawn_interval : float = 2.0
@export var object_scene : PackedScene

var timer : Timer

func _ready():
	# Timer to spawn falling objects at intervals
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = spawn_interval
	timer.connect("timeout", Callable(self, "_on_Timer_timeout"))  # Correct Callable reference
	timer.start()

func _on_Timer_timeout():
	spawn_falling_object()

func spawn_falling_object():
	var obj = object_scene.instantiate()
	obj.position = Vector2(randf_range(0, 800), -50)  # Random spawn position
	add_child(obj)
