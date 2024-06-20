class_name BaseGate
extends Node

var gate_location: Vector3 = Vector3.ZERO
var safe_respawn_location: Vector3 = Vector3.ZERO

var save_interval: int = 600

func _init(bounds: Area3D) -> void:
	if not bounds:
		return
	
	bounds.area_exited.connect(player_left_area)
	

# A fail safe for if the palyer glitches outside the dungeon
func player_left_area(player: Player) -> void:
	player.global_position = safe_respawn_location
