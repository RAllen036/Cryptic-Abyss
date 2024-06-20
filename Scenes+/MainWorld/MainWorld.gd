class_name MainWorld
extends Node3D

#region Other Connected nodes
@onready var respawn: Marker3D = $Respawn
#endregion

#region Export's
@export_category("Player Data")
@export var player_scene: PackedScene = null

#endregion

func _ready() -> void:
	# Load new players
	PlayerManager.player_joined.connect(create_player)
	PlayerManager.player_left.connect(remove_player)
	# Load existing players
	for player in PlayerManager.player_data:
		create_player(player)

#region Gate Management

# NOTE #
# Gate conditions etc will probs be calculated on another node / thread

@onready var gate_maker: GateMaker = $GateMaker
var available_gates: Array[BaseGate] = []

func get_available_gates() -> Array[BaseGate]:
	return []

func save_gates() -> Error:
	return ERR_UNAVAILABLE

func create_gate() -> BaseGate:
	return null

func entered_gate(player_id: int, gate_id: int) -> Error:
	return ERR_UNAVAILABLE

#endregion

#region Player Management
@onready var player_holder: Marker3D = $PlayerHolder
@onready var window_manager: WindowManager = $WindowManager

var players: Array[CharacterBody3D] = []

func create_player(player_id: int) -> void:
	var new_player := player_scene.instantiate() as CharacterBody3D
	player_holder.add_child(new_player)
	new_player.set_data(player_id)
	players.append(new_player)
	
	window_manager.add_window(player_id)
	

func remove_player(player_id: int) -> void:
	for player in player_holder.get_children():
		if player.id == player_id:
			player.queue_free()

#endregion

#region Calculate Economy

# NOTE #
# I'll probs init a few nodes that work on sub threads to calculate money flow etc
# Might think about C# or C++ for the extra objects / nodes to speed up maths etc but testing is required

#endregion
