extends Node

var managers: Dictionary = {}

func _ready() -> void:
	pass

func add_manager(manager: Node) -> bool:
	
	managers.merge({
		manager.name: manager
	})
	
	return true
