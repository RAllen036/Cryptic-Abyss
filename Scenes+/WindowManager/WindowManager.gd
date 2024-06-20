class_name WindowManager
extends Node

# NOTE
# Could put this as an auto load and then pass the window that needs to be instantiated ?

@export var packed_window: PackedScene = null

var windows: Array[Window] = []

func _ready() -> void:
	assert(
		packed_window != null, 
		"The window manager does not have a reference to a window scene."
		)
	PlayerManager.player_data_changed.connect(set_player_world)

func add_window(player_id: int) -> void:
	var new_window := packed_window.instantiate() as Window
	self.add_child(new_window)
	new_window.set_id(player_id)
	windows.append(new_window)

func remove_window(player_id: int) -> void:
	for window in windows:
		if window.id == player_id:
			windows.erase(window)
			window.queue_free()

func set_player_world(player_id: int) -> void:
	for window in windows:
		if window.id == player_id:
			window.world_3d = PlayerManager.player_data["world_3d"]
