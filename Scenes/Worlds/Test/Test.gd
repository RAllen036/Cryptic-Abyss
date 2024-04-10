extends Node3D

@onready var player_holder = $PlayerHolder

@export var packed_player: PackedScene = null
@export var dungeon_maker: PackedScene = null

func _ready() -> void:
	pass

func add_player(player_id) -> void:
	pass

func remove_player(player_id) -> bool:
	return false
