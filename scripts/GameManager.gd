extends Node

signal score_changed(score)
signal highscore_changed(score)

var player:CharacterBody2D=null
var pause_menu:Control = null
var is_paused:bool=false

var scores:Control=null
var death_screen:Control=null

var options_menu:Control = null
var is_options:bool=false

var score : int :
	set(value):
			score_changed.emit(value)
			score = value

var highscore : int :
	set(value):
			highscore_changed.emit(value)
			highscore = value

func add_score(value):
	if player != null && player.is_alive:	
		score += value
		if score > highscore:
			highscore = score

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
		if is_options:
			optionsMenu()

func pauseMenu():
	if pause_menu == null:
		return
		
	if is_paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	is_paused = !is_paused

func optionsMenu():
	if options_menu == null:
		return
		
	if is_options:
		if is_paused:
			pause_menu.show()
		options_menu.hide()
	else:
		if is_paused:
			pause_menu.hide()
		options_menu.show()
	is_options = !is_options

func _on_player_died():
	Engine.time_scale = 0
	print("Player died!")
	scores.hide()
	death_screen.show()

func newGame():
	score = 0
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://scenes/game.tscn")
