class_name PlayerWindow 
extends Window

signal leaving(id: int)

@onready var sub_viewport = $SubViewportContainer/SubViewport
@onready var camera: Camera3D = %Camera3D

var id: int = -2

func init(player_id: int) -> RemoteTransform3D:
	id = player_id
	var remote_transform: RemoteTransform3D = RemoteTransform3D.new()
	remote_transform.remote_path = camera.get_path()
	return remote_transform

func add_world(world: PackedScene) -> Node3D:
	
	if not world:
		push_error("A world was not passed through.")
		return null
	
	if not world.can_instantiate():
		push_error("World can not be instantiated.")
		return null
	
	var inst_world: Node3D = world.instantiate()
	sub_viewport.add_child(inst_world)
	
	return inst_world

func _on_close_requested() -> void:
	leaving.emit(id)
