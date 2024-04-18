extends Node

## This Script was made by Matjlars the creator of Multiplayer Input
## I have only adjusted a few sections to suit my needs

# player is 0-3
# device is -1 for keyboard/mouse, 0+ for joypads
# these concepts seem similar but it is useful to separate them so for example, device 6 could control player 1.

signal player_joined(new_player_data: Dictionary)
signal player_left(player_data: Dictionary)

signal joinability(value: bool)

# map from player integer to dictionary of data
# the existence of a key in this dictionary means this player is joined.
# use get_player_data() and set_player_data() to use this dictionary.
var player_data: Dictionary = {}

const MAX_PLAYERS = 4

var joinable: bool = false

func _process(_delta):
	if joinable:
		handle_join_input()
		
		if player_data.size() >= MAX_PLAYERS:
			set_joinability(false)
		

func set_joinability(value: bool) -> void:
	joinability.emit(value)

func join(device: int) -> void:
	var player_id = next_player()
	var input_map: DeviceInput = DeviceInput.new(device)
	if player_id >= 0:
		# initialize default player data here
		player_data[player_id] = {
			device = device,
			p_name = "Player%s" % player_id,
			input_map = input_map,
			team = device,
			remote_path = null,
		}
		print("Player %s joined." % player_id)
		print(player_data)
		player_joined.emit(player_id)

func leave(player: int):
	if player_data.has(player):
		player_data.erase(player)
		print(player_data)
		player_left.emit(player)

func get_player_count():
	return player_data.size()

func get_player_indexes():
	return player_data.keys()

func get_player_device(player: int) -> int:
	return get_player_data(player, "device")

# get player data.
# null means it doesn't exist.
func get_player_data(player: int, key: StringName):
	if player_data.has(player) and player_data[player].has(key):
		return player_data[player][key]
	return null

# set player data to get later
func set_player_data(player: int, key: StringName, value: Variant) -> void:
	# if this player is not joined, don't do anything:
	if not player_data.has(player):
		return
	
	player_data[player][key] = value

# call this from a loop in the main menu or anywhere they can join
# this is an example of how to look for an action on all devices
func handle_join_input() -> void:
	for device in get_unjoined_devices():
		if MultiplayerInput.is_action_just_pressed(device, "join"):
			join(device)

func is_device_joined(device: int) -> bool:
	for player_id in player_data:
		var d = get_player_device(player_id)
		if device == d: return true
	return false

# returns a valid player integer for a new player.
# returns -1 if there is no room for a new player.
func next_player() -> int:
	for i in MAX_PLAYERS:
		if !player_data.has(i): 
			return i
	return -1

# returns an array of all valid devices that are *not* associated with a joined player
func get_unjoined_devices():
	var devices = Input.get_connected_joypads()
	# also consider keyboard player
	devices.append(-1)
	
	# filter out devices that are joined:
	return devices.filter(func(device): return !is_device_joined(device))
