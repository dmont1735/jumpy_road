extends AnimatableBody2D

signal exited

func _physics_process(delta):
	global_position.x -= get_meta("move_speed") * delta
	GameManager.add_score(get_meta("move_speed") * delta)

func _on_hitbox_body_entered(body):
	if body.is_in_group("player"):
		body.die()

func _on_visible_on_screen_notifier_2d_screen_exited():
	emit_signal("exited")
	queue_free()
