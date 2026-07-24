extends Node2D

var texts = [
	"Люмен падает в пустоту. За спиной огромные крылья. Они держат его, но едва.",
	"Крылья начинают распадаться. С них слетают перья, растворяясь в воздухе. Вокруг Люмена появляются частицы ткани.",
	"Крылья почти исчезли. На плечах Люмена появляется длинный плащ. Лицо скрывается под маской.",
	"От крыльев остались только обрывки. Люмен почти полностью покрыт костюмом чумного доктора. Он падает быстрее.",
	"Жёсткое приземление. Люмен врезается в землю.",
	"Он поднимается. Вокруг него пространство подсознания.",
	"Здесь ему предстоит сражаться."
]
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$labelBox/text.text = texts[index]
	$fallingSound.play()
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
		comix(index)
	else:
		$AnimationPlayer.play("end_animation")
		await $AnimationPlayer.animation_finished
		get_tree().change_scene_to_file("res://scenes/siege.tscn")
		
func _on_back_button_button_down() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))

func _on_back_button_button_up() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	if index == 0:
		return 
	
	index -= 1
	$labelBox/text.text = texts[index]
	comix(index, false)
	
func comix(index, forward = true):
	if index > 0 and index < 7:
		$bookSound.play()
		if forward:
			$AnimationPlayer.play("comix%s_animation" %index)
		else:
			$AnimationPlayer.play_backwards("comix%s_animation" %index)
	if index == 4:
		$fallingSound.stop()
		$falledDownSound.play()
