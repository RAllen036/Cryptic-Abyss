class_name PlayerWindow
extends Window

signal leaving(id: int)

@onready var sub_viewport: SubViewport = $SubViewportContainer/SubViewport
@onready var camera: Camera3D = %Camera3D

var id: int = -2

func _ready() -> void:
	PlayerManager.player_data_changed.connect(func(player_id: int): pass)

func set_id(player_id: int) -> void:
	id = player_id
	PlayerManager.set_player_data(id, "remote_path", camera.get_path())

func _on_close_requested() -> void:
	if PlayerManager.player_data.has(id):
		PlayerManager.emit_signal("player_left", id)
	self.queue_free()
