class_name Player
extends CharacterBody3D

@onready var body_capsule = $BodyCapsule
@onready var neck = %Neck
@onready var head = %Head

var id: int = -2
var data: Dictionary = {}

func set_data(player_id) -> void:
	id = player_id
	data = PlayerManager.player_data[player_id]
	self.name = data.p_name
	print("Player Initialised.")

func _physics_process(delta: float) -> void:
	#print(self.global_position)
	pass
