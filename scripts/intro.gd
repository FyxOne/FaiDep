extends Node2D
var texts = [
	"В кабинете тихо. Только лампа гудит и страницы шуршат.",
	"Люмен читает уже второй час. Или третий. Работа экзорциста — это не только выезды. Это ещё и ожидание.",
	"Он уже хотел закрыть книгу, как телефон на тумбочке зазвонил. Старый чёрный аппарат. Звон разорвал тишину. Люмен снял трубку.",
	"- Люмен слушает.",
	"Голос на том конце произнёс адрес. Коротко. Без объяснений. Без имени пациента. Без подробностей.",
	"- Принято.",
	"Войд положил трубку и открыл книгу. На чистой странице записал данные о вызове."
]
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
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
		$AnimationPlayer.play("book_animation")


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


func _on_no_button_button_down() -> void:
	$book/noButton/noButtonLabel.visible = false


func _on_no_button_button_up() -> void:
	$book/noButton/noButtonLabel.visible = true
