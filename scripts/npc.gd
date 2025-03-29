extends CharacterBody2D

var player_in_area = false

func _process(delta: float):
	if player_in_area && !Dialogic.VAR.is_chatting:
		if Input.is_action_just_pressed("action"):
			run_dialogue("npc_1-suspicious")
	if Dialogic.VAR.exit:
		Dialogic.VAR.is_chatting = false
		Dialogic.VAR.exit = false

func _on_chat_detection_body_entered(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = true

func _on_chat_detection_body_exited(body: Node2D) -> void:
	if body.has_method("player"):
		player_in_area = false

func run_dialogue(dialogue):
	Dialogic.start(dialogue)
