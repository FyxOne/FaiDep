extends Node2D
var texts = Languages.strings[Global.language]["intro_texts"]
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Languages.translate_all(self)
	$bookSound.play()
	$labelBox/text.text = texts[index]
	$AnimationPlayer.play("start_animation")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_button_button_down() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))


func _on_next_button_button_up() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	index += 1
	if index < texts.size():
		$labelBox/text.text = texts[index]
	else:
		$bookSound.play()
		$AnimationPlayer.play("book_animation")
	
	if index == 2:
		$phoneSound.play()
	if index == 3 or index == 6:
		$phoneSound.stop()
		$getPhoneSound.play()
func _on_back_button_button_down() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))



func _on_back_button_button_up() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	if index == 0:
		return 
	
	index -= 1
	$labelBox/text.text = texts[index]


func _on_yes_button_button_down() -> void:
	$book/yesButton/yesButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))


func _on_yes_button_button_up() -> void:
	$book/yesButton/yesButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	$AnimationPlayer.play("end_animation")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file("res://scenes/arrival.tscn")


func _on_no_button_button_down() -> void:
	$book/noButton/noButtonLabel.visible = false


func _on_no_button_button_up() -> void:
	$book/noButton/noButtonLabel.visible = true
