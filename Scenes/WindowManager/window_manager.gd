class_name WindowHandler
extends Node

signal stopped

@export var packed_window: PackedScene = null
var packed_world: PackedScene

var inst_windows: Dictionary = {}

func _ready():
	get_viewport().set_embedding_subwindows(false)

func start_game(world: PackedScene) -> bool:
	
	if not world:
		push_error("World received a null reference.")
		return false
	
	packed_world = world
	
	# Start physics process on the world
	
	return true

func reload_game() -> bool:
	push_error("Reloading the game needs implementation.")
	return false

func change_worlds(world: PackedScene) -> bool:
	if not world:
		push_error("World received a null reference.")
		return false
	if not world.can_instantiate():
		push_error("World cannot be instantiated.")
		return false
	
	for key in inst_windows.keys():
		if not inst_windows[key].world:
			inst_windows[key].window.add_world(packed_world)
			break
	
	return true

func end_game() -> bool:
	push_error("Ending the game needs implementation.")
	return false

func add_window(player_id: int) -> RemoteTransform3D:
	
	if inst_windows.has(player_id):
		push_error("Player attempted to instanciate another window instance.")
		return null
	
	var inst_window: Window = packed_window.instantiate()
	self.add_child(inst_window.window)
	var inst_transform: RemoteTransform3D = inst_window.window.init()
	
	var inst_world: Node3D = null
	if inst_windows.is_empty():
		inst_world = inst_window.add_world()
		
	
	# Create window data
	
	inst_windows.merge({
		player_id : {window = inst_window, world = inst_world}
	})
	
	return inst_transform

func remove_window(player_id: int) -> bool:
	
	if not inst_windows.has(player_id):
		return false
	
	if inst_windows[player_id].world and inst_windows.size() > 1:
		var temp_dic: Dictionary = inst_windows
		temp_dic.erase(player_id)
		var key: int = temp_dic.keys()[0]
		inst_windows[player_id].world.reparent(inst_windows[key])
	
	inst_windows[player_id].window.queue_free()
	inst_windows.erase(player_id)
	
	if inst_windows.is_empty():
		return end_game()
	
	return true
	
