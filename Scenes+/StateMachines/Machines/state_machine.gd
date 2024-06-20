class_name StateMachine
extends Node

@export var current_state: BaseState = null
var states: Dictionary = {}

func _ready() -> void:
	for state in get_children():
		if not state is BaseState:
			continue
		state.player_ref = get_parent()
		state.transition.connect(_on_state_transition)
		states[state.name] = state
		if state.name.contains("Idle"):
			current_state = state
	current_state.enter()

func _process(delta: float) -> void:
	#print("Player %s State -> %s" % [get_parent().id, current_state.name])
	current_state.update(delta)

func _physics_process(delta: float) -> void:
	current_state.physics_update(delta)

func _on_state_transition(new_state_name: StringName) -> void:
	if not new_state_name in states:
		push_error("State is not connected to %s state machine." % get_parent().name)
		return
	
	var state: BaseState = states.get(new_state_name)
	
	if state == current_state:
		push_error("Attempted to re enter %s state." % current_state)
		return
	
	current_state.exit()
	state.enter()
	current_state = state
	
