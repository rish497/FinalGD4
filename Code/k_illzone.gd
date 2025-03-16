extends Area2D
@onready var timer: Timer = $Timer
@onready var popup: Window = $Node2D/Window2


func _on_body_entered(body: Node2D):
	print("died")
	
	Engine.time_scale = 0.5
	body.get_node ("CollisionShape20")
	timer.start()


func _on_timer_timeout():
	Engine.time_scale = 1.0 
	get_tree().reload_current_scene()
