extends Node2D

var texts1 = Languages.strings[Global.language]["arrival_texts1"]
var texts2 = Languages.strings[Global.language]["arrival_texts2"]
var index = 0
var isRoom = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Languages.translate_all(self)
	$labelBox/text.text = texts1[index]
	$AnimationPlayer.play("start_animation")
	$carSound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_next_button_button_down() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))


func _on_next_button_button_up() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	
	if not isRoom:
		index += 1
		if index < texts1.size():
			$labelBox/text.text = texts1[index]
		elif index == texts1.size():
			$AnimationPlayer.play("room_animation")
			isRoom = true
			index = 0
			$labelBox/text.text = texts2[index]
			
		if index == 3:
			var tween = create_tween()
			tween.tween_property($carSound, "volume_db", -80, 1.0)
			await tween.finished
			$carSound.stop()
		if index == 4:
			$carDoorSound.play()
	else:
		index += 1
		if index < texts2.size():
			$labelBox/text.text = texts2[index]
		else:
			$AnimationPlayer.play("end_animation")
			await $AnimationPlayer.animation_finished
			get_tree().change_scene_to_file("res://scenes/startSiege.tscn")


func _on_back_button_button_down() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))



func _on_back_button_button_up() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	
	if index == 0:
		if isRoom:
			isRoom = false
			index = texts1.size() - 1
			$labelBox/text.text = texts1[index]
		return
	
	index -= 1
	if isRoom:
		$labelBox/text.text = texts2[index]
	else:
		$labelBox/text.text = texts1[index]
	
