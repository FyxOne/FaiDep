extends Node2D

var minutes = int(Global.elapsed_time / 60)
var seconds = int(Global.elapsed_time) % 60
var milliseconds = int((Global.elapsed_time - int(Global.elapsed_time)) * 100)
var time_string = "%02d:%02d'%02d" % [minutes, seconds, milliseconds]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimationPlayer.play("start_animation")
	$defeatText/time.text = "Время: " + str(time_string)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	$Button/ButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))


func _on_button_button_up() -> void:
	$Button/ButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	get_tree().change_scene_to_file("res://scenes/siege.tscn")
