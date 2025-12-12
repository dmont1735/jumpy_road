extends CharacterBody2D

@export var jump_speed := -1200.0
@export var gravity := 1800.0
signal player_died()

var is_alive := true

func _ready():
	GameManager.player = self
	player_died.connect(GameManager._on_player_died)
	
func _physics_process(delta):
	if not is_alive:
		return
	# Apply gravity
	velocity.y += gravity * delta

	# Jump (space or touch)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed

	# Move player
	move_and_slide()

func die():
	is_alive = false
	player_died.emit()

	# Reset game, play animation, etc…

