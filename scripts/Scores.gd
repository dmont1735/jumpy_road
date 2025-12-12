extends Control

@onready var score_label = $ScoreLabel
@onready var highscore_label = $HighscoreLabel

func _ready():
	GameManager.scores = self
	GameManager.score_changed.connect(_on_score_changed_from_GM)
	GameManager.highscore_changed.connect(_on_highscore_changed_from_GM)
	
	score_label.text = "Score: " + String.num(GameManager.score)
	highscore_label.text = "Highscore: " + String.num(GameManager.highscore)

func _on_score_changed_from_GM(score):
	score_label.text =  "Score: " + String.num(score)

func _on_highscore_changed_from_GM(highscore):
	highscore_label.text =  "Highscore: " + String.num(highscore)
