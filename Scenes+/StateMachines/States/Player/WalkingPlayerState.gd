class_name WalkingPlayerState
extends BaseState

@export_range(0, 1000, 1, "or_greater") var speed: float = 10.0

func physics_process(delta: float) -> void:
	if is_zero_approx(player_ref.velocity.length()):
		transition.emit("IdlePlayerState")
	
	var device: DeviceInput = player_ref.data["input_map"]
	
	print("Walking")
	if device.is_action_just_pressed("Sprint"):
		print("Running")
		transition.emit("RunningPlayerState")
	
	var direction: Vector2 = device.get_vector(
		"Backward",
		"Forward",
		"StrafeRight",
		"StrafeLeft"
		)
	
	player_ref.velocity.x = lerpf(player_ref.velocity.x, direction.x * speed, 0.3)
	player_ref.velocity.y = lerpf(player_ref.velocity.y, direction.y * speed, 0.3)
	
