class_name Fish extends Area2D

@export var speed = randf_range(40, 120)

func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta

func pescado():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	pass
	#if body is Anzol:
		#pescado()
