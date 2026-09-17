extends CharacterBody2D
var speed = 40
@export var anim: AnimatedSprite2D
func _ready():
	$NameLabel.text=Global.player_name
func _physics_process(_delta):
	var input = Vector2(Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left'), Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up'))
	velocity = input.normalized() * speed
	
	if is_sitting:
		velocity = Vector2.ZERO
		move_and_slide()
		return
	
	if input.x > 0:
		anim.flip_h = true
	elif input.x < 0:
		anim.flip_h = false
	# Переключение состояний анимации
	if input != Vector2.ZERO:
		anim.play('walk')
	else:
		anim.play('idle')
		
	move_and_slide()


var is_sitting = false
# Функция мониторит все, что нажал игрок
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed('interact'):
		if is_sitting:
			is_sitting = false
			anim.play('idle')
		else:
			is_sitting = true
			anim.play('sit')


func _on_transition_zone_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
