extends Node2D

var texts1 = [
	"Ночь. Дорога пустая, машин нет. Только фары светят вперёд. За окнами - темнота.",
	"Войд за рулём, смотрит на дорогу. Он уже ездил по этому адресу. Не в этот дом, но в похожие. Каждый раз одно и то же.",
	"Дом появляется внезапно. Одноэтажный, старый, окна тёмные.",
	"Войд останавливается и выключает двигатель.",
	"Он берёт сумку с книгой с пассажирского сиденья, закрывает дверь машины и идёт к дому. Дверь не заперта. Он заходит.",
	"Внутри темно и тихо. Только лампа на тумбочке у кровати горит, но свет от неё слабый, почти не разгоняет темноту. Люмен останавливается у входа, осматривается."
]
var texts2 = [
	"На кровати лежит человек. Его тело окутано чёрным туманом. Густым, плотным.",
	"Он не двигается, но он живой, дышит, и туман колышется в такт дыханию. На месте глаз - два светящихся пятна.",
	"Он медленно подходит ближе, останавливается в паре шагов от кровати. Смотрит на пятна. Пятна смотрят на него.",
	"- Пожалуй, начнём"
]
var index = 0
var isRoom = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
	
