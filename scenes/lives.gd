extends Node2D

@onready var life3 = $Live3
@onready var life2 = $Live2
@onready var life1 = $Live1

var game_over_triggered := false

func _ready() -> void:
	update_lives()

func _physics_process(delta: float) -> void:
	update_lives()

func update_lives():
	life3.visible = Livescounter.lives >= 3
	life2.visible = Livescounter.lives >= 2
	life1.visible = Livescounter.lives >= 1
	
	if Livescounter.lives <= 0 and not game_over_triggered:
		game_over_triggered = true
		get_tree().change_scene_to_file("res://game_over.tscn")
