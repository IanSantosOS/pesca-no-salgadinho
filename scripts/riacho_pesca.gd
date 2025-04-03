extends Node2D

@export var fish_scenes: Array[PackedScene] = []

@onready var fish_container: Node2D = $FishContainer
@onready var timer: Timer = $EnemySpawnTimer

func _on_fish_spawn_timer_timeout() -> void:
	var fish = fish_scenes.pick_random().instantiate()
	fish.global_position = Vector2(350, randf_range(10, 170))
	fish_container.add_child(fish)
