extends Node2D

@export var obstacle_scenes : Array[PackedScene]
@export var move_speed := 250.0
@export var car_start_y := 630.0
@onready var obstacle_container := $"../ObstacleContainer"
var speed_ramp := 1.0

func _ready():
	spawn_obstacle()  # spawn the first obstacle

func spawn_obstacle():
	if obstacle_scenes.is_empty():
		return

	var scene = obstacle_scenes.pick_random()
	var obstacle = scene.instantiate()
	var spawning_position = Vector2(global_position.x, car_start_y)
	
	obstacle.set_meta("move_speed", move_speed * speed_ramp)
	obstacle.position = spawning_position
	obstacle_container.add_child(obstacle)
	obstacle.connect("exited", Callable(self, "_on_obstacle_exited"))

func _on_obstacle_exited():
	speed_ramp += 0.05
	spawn_obstacle()
