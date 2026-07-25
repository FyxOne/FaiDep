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
var active_tab = "attack"

var demon_hp = 1.0
var obsession = 1.0
var mask_hp = 1.0
var sanity = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$labelBox/text.text = texts[index]
	$AnimationPlayer.play("start_animation")
	set_tab("attack")
	
	set_demon_hp(demon_hp)
	set_obsession(obsession)
	set_mask_hp(mask_hp)
	set_sanity(sanity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mask_hp > 0:
		mask_hp -= 0.0001
		set_mask_hp(mask_hp)
	else:
		sanity -= 0.001
		set_sanity(sanity)

func _on_next_button_button_down() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))


func _on_next_button_button_up() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	index += 1
	if index < texts.size():
		$labelBox/text.text = texts[index]
	else:
		$AnimationPlayer.play("siege_animation")
		demon_atack()
		
func _on_back_button_button_down() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))

func _on_back_button_button_up() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	if index == 0:
		return 
	
	index -= 1
	$labelBox/text.text = texts[index]


func _on_attack_tab_button_down() -> void:
	set_tab("attack")

func _on_clean_tab_button_down() -> void:
	set_tab("clean")

func _on_repair_tab_button_down() -> void:
	set_tab("repair")

func set_tab(tab):
	if tab == "attack":
		active_tab = "attack"
		$book/cleanTab.button_pressed = false
		$book/repairTab.button_pressed = false
		
		$book/attackTab/attackTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
		$book/cleanTab/cleanTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/repairTab/repairTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		
	if tab == "clean":
		active_tab = "clean"
		$book/attackTab.button_pressed = false
		$book/repairTab.button_pressed = false
		
		$book/attackTab/attackTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/cleanTab/cleanTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
		$book/repairTab/repairTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	if tab == "repair":
		active_tab = "repair"
		$book/attackTab.button_pressed = false
		$book/cleanTab.button_pressed = false
		
		$book/attackTab/attackTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/cleanTab/cleanTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/repairTab/repairTabLabel.add_theme_color_override("font_color", Color("#ffff64"))

func set_demon_hp(value):
	$scalesIcons/demonScaleFrame/demonHp.size.x = 240 * value
func set_obsession(value):
	$scalesIcons/obsessionScaleFrame/obsession.size.x = 240 * value
func set_mask_hp(value):
	$scalesIcons/maskScaleFrame/mask.size.x = 240 * value
func set_sanity(value):
	$scalesIcons/sanityScaleFrame/sanity.size.x = 240 * value

func _on_start_button_button_up() -> void:
	if active_tab == "attack":
		if demon_hp > 0:
			demon_hp -= 0.1
			set_demon_hp(demon_hp)
	if active_tab == "clean":
		if obsession > 0:
			obsession -= 0.01
			set_obsession(obsession)
	if active_tab == "repair":
		if mask_hp < 1.0:
			mask_hp = 1.0
			set_mask_hp(mask_hp)

func demon_atack():
	while demon_hp > 0:
		await get_tree().create_timer(5.0).timeout
		if mask_hp > 0:
			mask_hp -= 0.1
			set_mask_hp(mask_hp)
		else:
			sanity -= 0.1
			set_sanity(sanity)
