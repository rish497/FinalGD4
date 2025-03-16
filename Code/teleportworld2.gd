extends Area2D
@onready var sprite_2d_2: Sprite2D = $Sprite2D2
var entered = false


func _on_body_entered(body: PhysicsBody2D):
		entered = true
		get_tree().change_scene_to_file("res://scenes/World23.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
