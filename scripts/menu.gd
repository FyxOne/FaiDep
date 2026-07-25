extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_button_button_down() -> void:
	$playButton/playButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))

func _on_play_button_button_up() -> void:
	$playButton/playButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	Global.timer_running = true
	Global.elapsed_time = 0.0
	get_tree().change_scene_to_file("res://scenes/intro.tscn")

func _on_lore_button_button_down() -> void:
	$loreButton/loreButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	
func _on_lore_button_button_up() -> void:
	$loreButton/loreButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	get_tree().change_scene_to_file("res://scenes/lore.tscn")


func _on_fullscreen_button_button_up() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
