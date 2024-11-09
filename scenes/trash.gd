extends Area2D

@onready var game_manager: Node = $"/root/game/GameManager"

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		game_manager.add_point()
		queue_free()
	
	if body is RigidBody2D:
		#resert coordinates if trash is on obstacle
		var x = randi_range(-780, 780)
		var y = randi_range(-510, 520)
		global_position = Vector2(x, y)
