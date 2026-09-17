extends Control

@onready var line_edit = $LineEdit # Укажи путь к своему LineEdit
@onready var button = $Button # Укажи путь к своей Button

func _ready():
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	var player_name = line_edit.text.strip_edges() # Убираем пробелы по краям

	if player_name.length() > 2: # Проверка: имя больше 2 символов
		Global.player_name = player_name
		get_tree().change_scene_to_file("res://scenes/forest.tscn") # Замени на путь к своей главной сцене
	else:
		print("Имя слишком короткое!") # Или покажи всплывающее окно
