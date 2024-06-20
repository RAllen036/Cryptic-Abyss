class_name Log
extends Node

enum Settings {
	SAVE = 0,
	PRETTY = 1,
	HIDE = 2,
	LONG_TIME = 3,
	LONG_DATE = 4,
	PREFIX_CALLSTACK = 5,
	
}

var save_file: FileAccess = null
var default_file_location: String = "user://Log/"
var save_buffer: Array[String] = []

func qpr(text: String = "") -> void:
	pass

func ppr(text: String = "", settings: Array[Settings] = []) -> void:
	pass

func err(error: Error = ERR_BUG, settings: Array[Settings] = []):
	pass

func exec_settings(settings: Array[Settings]) -> void:
	# Essentially a large match statement that does / calls necesary functions
	pass

func add_datetime(text: String, settings: Array[Settings]) -> String:
	# Add Date
	
	# Add Time
	
	return ""
