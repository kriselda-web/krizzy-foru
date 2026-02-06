extends Area2D

@onready var timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		$CollisionShape2D.disabled = true
		Livescounter.lose_life()
		timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
