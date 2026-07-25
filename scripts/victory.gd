extends Node2D

var minutes = int(Global.elapsed_time / 60)
var seconds = int(Global.elapsed_time) % 60
var milliseconds = int((Global.elapsed_time - int(Global.elapsed_time)) * 100)
var time_string = "%02d:%02d'%02d" % [minutes, seconds, milliseconds]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Время: " + time_string)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
