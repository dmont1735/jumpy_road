extends CharacterBody2D

@export var jump_speed := -825.0
@export var gravity_up := 800.0
@export var gravity_down := 1300.0
@onready var animated_sprite_2d = $AnimatedSprite2D

signal player_died()

var is_alive := true

func _ready():
	GameManager.player = self
	player_died.connect(GameManager._on_player_died)
	animated_sprite_2d.play("run")
	
func _physics_process(delta):
	if not is_alive:
		return

	# Apply gravity
	if velocity.y < 0:
		velocity.y += gravity_up * delta
	else:
		velocity.y += gravity_down * delta

	# Jump input
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed
		animated_sprite_2d.play("jump")

	move_and_slide()
	update_animation()

func update_animation():
	if not is_alive:
		return

	if is_on_floor():
		if animated_sprite_2d.animation != "run":
			animated_sprite_2d.play("run")
	else:
		if velocity.y < 0:
			if animated_sprite_2d.animation != "jump":
				animated_sprite_2d.play("jump")
		else:
			if animated_sprite_2d.animation != "fall":
				animated_sprite_2d.play("fall")


func die():
	is_alive = false
	player_died.emit()

	# Reset game, play animation, etc…
