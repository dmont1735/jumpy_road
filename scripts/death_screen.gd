extends Control

var scoreLabel:Label=null
var highscoreLabel:Label=null

func _ready():
	GameManager.death_screen = self
	GameManager.score_changed.connect(_on_score_changed_from_GM)
	GameManager.highscore_changed.connect(_on_highscore_changed_from_GM)
	
	scoreLabel = get_node("./Score")
	highscoreLabel = get_node("./Highscore")
	
	scoreLabel.text = "Score: " + String.num(GameManager.score)
	highscoreLabel.text = "Highscore: " + String.num(GameManager.highscore)

func _on_score_changed_from_GM(score):
	scoreLabel.text =  "Score: " + String.num(score)

func _on_highscore_changed_from_GM(highscore):
	highscoreLabel.text =  "Highscore: " + String.num(highscore)

func _on_new_game_pressed():
	GameManager.newGame()

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()
