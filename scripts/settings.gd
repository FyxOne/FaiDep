extends Node2D

var volumeValue = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Languages.translate_all(self)
	
	$volumeLabel/volumeSlider.value = Global.master_volume
	
	if Global.language == "ru":
		$languageLabel/languageOption.select(0)
	else:
		$languageLabel/languageOption.select(1)
	
	if Global.gameMode == "default":
		$gameModeLabel/gameModeOption.select(0)
	else:
		$gameModeLabel/gameModeOption.select(1)

	$bookWords/SpinBox.value = Global.word_count


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$volumeLabel/volumeLevelLabel.text = str(int(volumeValue))


func _on_volume_slider_value_changed(value: float) -> void:
	Global.master_volume = value
	volumeValue = value * 100
	
	var bus_idx = AudioServer.get_bus_index("Master")
	if value <= 0.01:
		AudioServer.set_bus_mute(bus_idx, true)
	else:
		AudioServer.set_bus_mute(bus_idx, false)
		AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value))

func _on_fullscreen_button_button_up() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _on_home_tab_button_up() -> void:
	$homeTab/homeArrow.texture = load("res://resources/textures/arrow_pressed.png")
	Global.toggle_settings()

func _on_home_tab_button_down() -> void:
	$homeTab/homeArrow.texture = load("res://resources/textures/arrow.png")


func _on_game_mode_option_item_selected(index: int) -> void:
	if index == 0: 
		Global.gameMode = "default"
	if index == 1: 
		Global.gameMode = "lite"

func _on_spin_box_value_changed(value: float) -> void:
	Global.word_count = int(value)

func _on_language_option_item_selected(index: int) -> void:
	if index == 0: 
		Global.language = "ru"
	if index == 1: 
		Global.language = "en"
		
	Languages.translate_all(self)
