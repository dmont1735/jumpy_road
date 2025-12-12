extends Node2D

@onready var options_menu = $Options
@onready var main = $Main

var is_options:bool=false

func _on_new_game_button_pressed():
	GameManager.newGame()

func _on_options_button_pressed():
	optionsMenu()

func _on_quit_button_pressed():
	get_tree().quit()

func optionsMenu():
	if options_menu == null:
		return
	if !is_options:
		main.hide()
		options_menu.show()
	else:
		options_menu.hide()
		main.show()
	is_options = !is_options
