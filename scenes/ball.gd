extends RigidBody2D

const SPEED_UP = 4
const MAX_SPEED = 300



func _physics_process(delta):
	if position.y > get_viewport_rect().end.y:
		queue_free()


func _on_Ball_body_entered(body):
	if body.is_in_group("bricks"):
		$"/root/Game/Score".score += 5
		body.queue_free()
			
	if body.name == "Paddle":
		var speed = linear_velocity.length()
		var direction = position - body.get_node("Ancor").global_position
		var velocity = direction.normalized() * min(speed + SPEED_UP, MAX_SPEED)
		linear_velocity = velocity