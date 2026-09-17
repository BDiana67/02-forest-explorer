extends Area2D

func _ready():
# Подключаем сигнал: когда кто-то входит в зону
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.name == "Player": # Проверяем, что это именно игрок
# Загружаем новую сцену
		get_tree().change_scene_to_file("res://scenes/next_level.tscn") # Укажи путь к новой сцене
