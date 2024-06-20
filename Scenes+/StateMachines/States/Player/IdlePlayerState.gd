class_name IdlePlayerState
extends BaseState

func physics_update(delta: float) -> void:
	if player_ref.velocity.length() > 0.0:
		transition.emit("WalkingPlayerState")
	var device: DeviceInput = player_ref.data["input_map"]
	
	if device.get_vector("Backward", "Forward", "StrafeRight", "StrafeLeft") != Vector2.ZERO:
			if device.is_action_pressed("Sprint"):
				transition.emit("RunningPlayerState")
			else:
				transition.emit("WalkingPlayerState")
	
