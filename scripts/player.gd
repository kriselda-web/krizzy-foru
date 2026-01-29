extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -300.0
@onready var animatedsprite_2d = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#animation
	if (velocity.x >1 || velocity.x <-1):
		animatedsprite_2d.animation = "walk"
	else:
		animatedsprite_2d.animation = "default"
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	animatedsprite_2d.flip_h = isLeft
