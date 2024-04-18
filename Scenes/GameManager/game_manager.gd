class_name WindowHandler
extends Node

@export var packed_window: PackedScene = null

var inst_windows: Dictionary = {}

var world: Node3D = null
var joinable: bool = false

func _ready() -> void:
	
	PlayerManager.set_joinability(false)
	
	PlayerManager.connect("player_joined", _on_player_joined)
	PlayerManager.connect("player_left", _on_player_left)
	PlayerManager.connect("joinability", joinability_changed)
	

func start_game() -> bool:
	
	if PlayerManager.player_data.size() >= 1:
		for player in PlayerManager.player_data:
			world.create_player(player)
	
	return true

func reload_game() -> bool:
	push_error("Reloading the game needs implementation.")
	return false

func end_game() -> void:
	push_error("Ending the game needs implementation.")
	return

func change_world(packed_world: PackedScene) -> void:
	if not packed_world:
		push_error("World recieved is a null value. Temporarily stopping players from joining.")
		PlayerManager.set_joinability(false)
		return
	
	world = packed_world.instantiate()
	self.add_child(world)
	
	if not joinable:
		PlayerManager.set_joinability(true)
	

func add_window(player_id: int) -> void:
	
	if inst_windows.has(player_id):
		push_error("Player attempted to instanciate another window instance.")
		return
	
	var inst_window: Window = packed_window.instantiate()
	self.add_child(inst_window)
	inst_window.connect("leaving", remove_window)
	inst_window.init(player_id)
	
	# Create window data
	
	inst_windows[player_id] = {
		window = inst_window,
	}

func remove_window(player_id: int) -> void:
	
	if not inst_windows.has(player_id):
		return
	
	inst_windows[player_id].window.queue_free()
	
	inst_windows.erase(player_id)
	
	PlayerManager.leave(player_id)
	
	if inst_windows.is_empty():
		end_game()
	

func joinability_changed(value: bool) -> void:
	joinable = value

func _on_player_joined(player_id: int) -> void:
	add_window(player_id)

func _on_player_left(player_id: int) -> void:
	remove_window(player_id)
