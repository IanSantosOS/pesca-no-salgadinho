extends Node2D

@onready var collision_polygon_2d: CollisionPolygon2D = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d: Polygon2D = $StaticBody2D/CollisionPolygon2D/Polygon2D

@onready var collision_polygon_2d2: CollisionPolygon2D = $StaticBody2D2/CollisionPolygon2D
@onready var polygon_2d2: Polygon2D = $StaticBody2D2/CollisionPolygon2D/Polygon2D

var player_in_area = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	polygon_2d.polygon = collision_polygon_2d.polygon
	polygon_2d2.polygon = collision_polygon_2d2.polygon
	
	if player_in_area:
		if Input.is_action_just_pressed("action") or Input.is_action_just_pressed("select"):
			get_tree().change_scene_to_file("res://scenes/riacho-pesca.tscn")

func _on_static_body_2d_2_body_entered(body: Node2D) -> void:
	player_in_area = true

func _on_static_body_2d_2_body_exited(body: Node2D) -> void:
	player_in_area = false
