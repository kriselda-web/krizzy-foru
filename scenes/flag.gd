extends Area2D

@export var next_level: PackedScene

func _ready():
	# Force the signal connection in code (in case UI connection is broken)
	self.body_entered.connect(_on_flag_body_entered)
	print("Flag ready - Monitoring: ", monitoring, " | Mask: ", collision_mask)

func _on_flag_body_entered(body):
	print("Something touched flag: ", body.name)
	
	if body.name == "Player":
		print("PLAYER DETECTED! Loading next level...")
		if next_level:
			print("Loading: ", next_level.resource_path)
			get_tree().change_scene_to_packed(next_level)
		else:
			print("ERROR: next_level is not assigned in Inspector!")
