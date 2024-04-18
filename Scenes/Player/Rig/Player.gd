extends CharacterBody3D

@onready var body_capsule = $BodyCapsule
@onready var neck = %Neck
@onready var head = %Head

var data: Dictionary = {}

func init(player_id: int) -> void:
	data = PlayerManager.player_data[player_id]
	self.name = data.p_name

func _ready() -> void:
	print("Player initialised.")


