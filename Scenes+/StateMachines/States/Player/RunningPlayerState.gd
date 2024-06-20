class_name RunningPlayerState
extends BaseState

@export_range(1, 20, 1, "or_greater") var speed: float = 20.0

func physics_update(delta: float) -> void:
	if is_zero_approx(player_ref.velocity.length()):
		transition.emit("IdlePlayerState")
	
	var device: DeviceInput = player_ref.data["input_map"]
	
	if not device.is_action_pressed("Sprint"):
		transition.emit("WalkingPlayerState")
	
	var direction: Vector2 = device.get_vector(
		"Backward",
		"Forward",
		"StrafeRight",
		"StrafeLeft"
		)
	
	player_ref.velocity.x = lerpf(player_ref.velocity.x, direction.x * speed, 0.6)
	player_ref.velocity.y = lerpf(player_ref.velocity.y, direction.y * speed, 0.6)
	
