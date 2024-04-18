extends Window

signal leaving(id: int)

@onready var sub_viewport = $SubViewportContainer/SubViewport
@onready var camera: Camera3D = %Camera3D

var id: int = -2

func init(player_id: int) -> void:
	id = player_id
	PlayerManager.set_player_data(player_id, "remote_path", camera.get_path())

func _on_close_requested() -> void:
	leaving.emit(id)
