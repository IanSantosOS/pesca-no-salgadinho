class_name Fish extends Area2D

@export var speed = randf_range(40, 120)

func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta

func pescado():
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	if area is Anzol:
		pescado()
