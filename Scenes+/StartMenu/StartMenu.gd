extends Control

@onready var start: Button = %Start
@onready var settings: Button = %Settings

@export var main_world: PackedScene = null
@export var packed_settings: PackedScene = null

func _ready() -> void:
	assert(main_world != null, "Main world scene not connected to the Start menu.")
	if packed_settings == null:
		settings.disabled = true
	PlayerManager.player_joined.connect(func(_player_id: int): start.disabled = false)
	PlayerManager.player_left.connect(
		func(_player_id: int):
			if PlayerManager.player_data.size() >= 1:
				start.disabled = true
	)

func _on_start_pressed() -> void:
	get_tree().change_scene_to_packed(main_world)

func _on_settings_pressed() -> void:
	pass

func _on_quit_pressed() -> void:
	get_tree().quit()
