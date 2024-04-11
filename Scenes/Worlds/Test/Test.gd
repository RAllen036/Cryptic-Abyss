extends Node3D

@onready var player_holder = $PlayerHolder

@onready var dungeon_maker: DungeonMaker = DungeonMaker.new()

var joinable: bool = false

func _ready() -> void:
	pass

func _process(delta):
	pass
