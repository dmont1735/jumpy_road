extends Control

func _ready():
	GameManager.pause_menu =  self

func _on_resume_button_pressed():
	GameManager.pauseMenu()

func _on_options_button_pressed():
	GameManager.optionsMenu()


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
