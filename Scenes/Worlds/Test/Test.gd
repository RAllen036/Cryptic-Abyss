extends Node3D

@export var packed_player: PackedScene = null

@onready var player_holder = $PlayerHolder

@onready var dungeon_maker: DungeonMaker = DungeonMaker.new()


func _process(delta) -> void:
	return

func create_player(player_id: int) -> bool:
	var inst_player: CharacterBody3D = packed_player.instantiate()
	player_holder.add_child(inst_player)
	inst_player.init(player_id)
	return false
