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

var word_count = Global.word_count
var current_index = 0
var last_click_time = 0.0

var demon_hp = 1.0
var obsession = 1.0
var mask_hp = 1.0
var sanity = 1.0

var isDemonAlive = true
var is_game_over = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.set_scene("siege")
	Global.set_obsession(obsession)
	$end.visible = false
	$labelBox/text.text = texts[index]
	$AnimationPlayer.play("start_animation")
	set_tab("attack")
	
	create_words()
	
	set_demon_hp(demon_hp)
	set_obsession(obsession)
	set_mask_hp(mask_hp)
	set_sanity(sanity)
	
	$corridor/damage.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mask_hp > 0:
		mask_hp -= 0.0001
		set_mask_hp(mask_hp)
	else:
		sanity -= 0.001
		set_sanity(sanity)
		
	if demon_hp <= 0.001 and isDemonAlive == true:
		isDemonAlive = false
		$demonSound.play()
		$AnimationPlayer.play_backwards("demon_animation")
		
	if isDemonAlive == false:
		demon_hp += 0.0005
		set_demon_hp(demon_hp)
		if demon_hp >= 1.0:
			demon_hp = 1.0
			set_demon_hp(demon_hp)
			isDemonAlive = true
			$demonSound.play()
			$AnimationPlayer.play("demon_animation")
			demon_atack()
			
	if obsession <= 0 and not is_game_over:
		is_game_over = true
		Global.timer_running = false
		isDemonAlive = false
		$demonDying.play()
		$AnimationPlayer.play_backwards("demon_animation")	
		await $demonDying.finished
		$end.visible = true
		$teleportSound.play()
		$AnimationPlayer.play("end_animation")
		await $teleportSound.finished
		get_tree().change_scene_to_file("res://scenes/victory.tscn")
		
	if sanity <= 0 and not is_game_over:
		is_game_over = true
		$end.visible = true
		$deathSound.play()
		$AnimationPlayer.play("end_animation")
		Global.set_scene("defeat")
		await $deathSound.finished
		get_tree().change_scene_to_file("res://scenes/defeat.tscn")

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
		$demonSound.play()
		
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
	$bookSound.play()

func _on_clean_tab_button_down() -> void:
	set_tab("clean")
	$bookSound.play()

func _on_repair_tab_button_down() -> void:
	set_tab("repair")
	$bookSound.play()

func set_tab(tab):
	if tab == "attack":
		active_tab = "attack"
		$book/cleanTab.button_pressed = false
		$book/repairTab.button_pressed = false
		
		$book/attackTab/attackTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
		$book/cleanTab/cleanTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/repairTab/repairTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		create_words()
		
	if tab == "clean":
		active_tab = "clean"
		$book/attackTab.button_pressed = false
		$book/repairTab.button_pressed = false
		
		$book/attackTab/attackTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/cleanTab/cleanTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
		$book/repairTab/repairTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		create_words()
	if tab == "repair":
		active_tab = "repair"
		$book/attackTab.button_pressed = false
		$book/cleanTab.button_pressed = false
		
		$book/attackTab/attackTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/cleanTab/cleanTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
		$book/repairTab/repairTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
		create_words()

func set_demon_hp(value):
	$scalesIcons/demonScaleFrame/demonHp.size.x = 240 * value
func set_obsession(value):
	$scalesIcons/obsessionScaleFrame/obsession.size.x = 240 * value
func set_mask_hp(value):
	$scalesIcons/maskScaleFrame/mask.size.x = 240 * value
func set_sanity(value):
	$scalesIcons/sanityScaleFrame/sanity.size.x = 240 * value

func demon_atack():
	while isDemonAlive == true and not is_game_over:
		if mask_hp > 0:
			mask_hp -= 0.25
			set_mask_hp(mask_hp)
		else:
			sanity -= 0.1
			set_sanity(sanity)
		await get_tree().create_timer(2.4).timeout
		if isDemonAlive:
			$corridor/damage.visible = true
			$damageSound.play()
			$AnimationPlayer.play("damage_animation")
			await $AnimationPlayer.animation_finished
			$corridor/damage.visible = false

func create_words():
	for child in $book/FlowContainer.get_children():
		child.queue_free()
	
	current_index = 0
	last_click_time = 0.0
	
	if Global.gameMode == "default":
		for i in range(word_count - 1):
			var btn = Button.new()
			btn.custom_minimum_size = Vector2(randi_range(20, 100), 20)
			
			var style = StyleBoxFlat.new()
			style.bg_color = Color("#ffff64")
			style.set_corner_radius_all(0)
			
			btn.add_theme_stylebox_override("normal", style)
			btn.add_theme_stylebox_override("hover", style)
			btn.add_theme_stylebox_override("pressed", style)
			
			btn.pressed.connect(_on_word_clicked.bind(i))
			$book/FlowContainer.add_child(btn)
			
	if Global.gameMode == "lite":
		var btn = Button.new()
		btn.custom_minimum_size = $book/FlowContainer.size
			
		var style = StyleBoxFlat.new()
		style.bg_color = Color("#ffff64")
		style.set_corner_radius_all(0)
			
		btn.add_theme_stylebox_override("normal", style)
		btn.add_theme_stylebox_override("hover", style)
		btn.add_theme_stylebox_override("pressed", style)
			
		btn.pressed.connect(_on_word_clicked.bind(0))
		$book/FlowContainer.add_child(btn)

func _on_word_clicked(index):
	if Global.gameMode == "default" and index != current_index:
		return
		
	var btn = $book/FlowContainer.get_child(index)
	
	if active_tab == "attack":
		if isDemonAlive == true:
			demon_hp -= 0.05
			if demon_hp < 0:
				demon_hp = 0
			set_demon_hp(demon_hp)
		
	if active_tab == "clean":
		if obsession > 0:
			obsession -= 0.01
			if obsession < 0:
				obsession = 0
			set_obsession(obsession)
			Global.set_obsession(obsession)
			
	if active_tab == "repair":
		if mask_hp < 1.0:
			mask_hp += 0.1
			if mask_hp > 1.0:
				mask_hp = 1.0
			set_mask_hp(mask_hp)
	
	$penSound.play()
	current_index += 1
	if Global.gameMode == "default":
		btn.disabled = true
		btn.modulate.a = 0
	
	if current_index >= word_count - 1 and Global.gameMode == "default":
		create_words()
