extends Node2D
var texts = [
	"Теперь ты внутри подсознания пациента. Перед тобой демон. Твоя задача - очистить разум пациента от заражениния.",
	"Маска Люмена защищает его разум от потери рассудка. От воздействия среды маска понемногу теряет прочность",
	"Если маска разрушится, то Люмен начнёт терят рассудок, и его разумом овладеет демон.",
	"Убить демона невозможно, но можно оглушить. Пока демон в сознании, то он атакует Люмена. Каждая атака снимает прочность маски.",
	"В книге три раздела заклинаний:",
	"Атака - на время оглушает демона.",
	"Очищение - чистит разум пациента от заражения.",
	"Починка - восстанавливает маску.",
	"Удачи."
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
		$AnimationPlayer.play("siege_animation")
		
func _on_back_button_button_down() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))

func _on_back_button_button_up() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	if index == 0:
		return 
	
	index -= 1
	$labelBox/text.text = texts[index]
