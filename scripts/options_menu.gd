extends Control

func _ready():
	GameManager.options_menu = self

func _on_back_button_pressed():
	if get_parent().name=="MainMenu":
		get_parent().optionsMenu()
	else:
		GameManager.optionsMenu()

func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0,value)

func _on_mute_all_check_box_toggled(button_pressed):
	AudioServer.set_bus_mute(0,button_pressed)


func _on_resolution_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1600,900))
		2:
			DisplayServer.window_set_size(Vector2i(1080,720))


func _on_fullscreen_toggled(button_pressed):
	if button_pressed:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		
