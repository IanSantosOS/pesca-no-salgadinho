class_name Anzol extends Area2D

func _process(delta):
	# Obtém a posição global do mouse
	var mouse_pos = get_global_mouse_position()
	
	# Atualiza a posição do Node2D para seguir o mouse
	position = mouse_pos
