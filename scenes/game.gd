extends Node

const Ball = preload("res://scenes/Ball.tscn")



func _input(event):
	if event.is_action_pressed("ui_mouse_left"):
		var ball = Ball.instance()
		ball.position = $Paddle.position - Vector2(0, 16)
		add_child(ball)