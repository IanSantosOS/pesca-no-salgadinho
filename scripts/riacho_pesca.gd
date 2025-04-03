extends Node2D

@export var fish_scenes: Array[PackedScene] = []

@onready var fish_container: Node2D = $FishContainer
@onready var timer: Timer = $EnemySpawnTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("cancel"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_fish_spawn_timer_timeout() -> void:
	var fish = fish_scenes.pick_random().instantiate()
	fish.global_position = Vector2(350, randf_range(10, 170))
	fish_container.add_child(fish)
