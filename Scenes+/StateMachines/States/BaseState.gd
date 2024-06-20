class_name BaseState
extends Node

signal transition(new_state_name: StringName)

var player_ref: CharacterBody3D = null

func _ready() -> void:
	pass

func enter() -> void:
	pass

func exit() -> void:
	pass

@warning_ignore("unassigned_variable")

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass
