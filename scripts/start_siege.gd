extends Node2D

var texts = [
	"Люмен садится на стул у кровати и открывает книгу на нужной странице.",
	"В книге написано заклинание. Его нужно читать вслух с определённой скоростью - не слишком быстро и не слишком медленно. От этого зависит пульс пациента.",
	"Если скорость будет правильной - пульс останется ровным, и Люмен сможет войти в подсознание.",
	"Если нет - пациент умрёт.",
	"Люмен делает глубокий вдох и начинает."
]
var index = 0
var word_count = 100
var current_index = 0
var bpm = 75
var last_click_time = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$labelBox/text.text = texts[index]
	$AnimationPlayer.play("start_animation")
	$heart/bpm.text = str(bpm)
	create_words()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if last_click_time == 0:
		return
	
	var now = Time.get_ticks_msec() / 1000.0
	var elapsed = now - last_click_time
	var expected_time = 60.0 / bpm
	
	var tolerance = expected_time * 0.25
	if elapsed >= expected_time - tolerance and elapsed <= expected_time + tolerance:
		$heart/bpm.add_theme_color_override("font_color", Color("#ffff64"))
	else:
		$heart/bpm.add_theme_color_override("font_color", Color("#ffaf5f"))


func _on_next_button_button_down() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))


func _on_next_button_button_up() -> void:
	$labelBox/nextButton/nextButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	
	if $labelBox/text.text == "Пациент скончался.":
		get_tree().change_scene_to_file("res://scenes/startSiege.tscn")
		return
	
	index += 1
	if index < texts.size():
		$labelBox/text.text = texts[index]
	else:
		$bookSound.play()
		$AnimationPlayer.play("startSiege_animation")
		heartbeat()


func _on_back_button_button_down() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffaf5f"))



func _on_back_button_button_up() -> void:
	$labelBox/backButton/backButtonLabel.add_theme_color_override("font_color", Color("#ffff64"))
	if index == 0:
		return 
	
	index -= 1
	$labelBox/text.text = texts[index]
	
func heartbeat():
	while (bpm > 40 and bpm < 150) and (current_index < word_count):
		$pulseAudio.play()
		$heart.texture = preload("res://resources/textures/heart1.png")
		await get_tree().create_timer(60.0 / bpm).timeout
			
		$pulseAudio.play()
		$heart.texture = preload("res://resources/textures/heart2.png")
		await get_tree().create_timer(60.0 / bpm).timeout

func create_words():
	for i in range(word_count):
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

func _on_word_clicked(index):
	if index != current_index:
		return
		
	var now = Time.get_ticks_msec() / 1000.0
	var btn = $book/FlowContainer.get_child(index)
	
	if last_click_time == 0:
		$penSound.play()
		last_click_time = now
		btn.disabled = true
		btn.modulate.a = 0
		current_index += 1
		return

	var delta = now - last_click_time
	last_click_time = now
	
	var expected_time = 60.0 / bpm 
	var diff = delta - expected_time
	
	var recovery_speed = 1.0
	if abs(diff) < 0.25:
		if bpm < 75:
			bpm += recovery_speed * 0.5
		elif bpm > 75:
			bpm -= recovery_speed * 0.5
	else:
		if diff > 0:
			bpm -= abs(diff) * 25
		else:
			bpm += abs(diff) * 75
	
	$heart/bpm.text = str(int(round(bpm)))

# смерть (💀черепок☠️)
	if bpm <= 40 or bpm >= 150:
		$heart/bpm.visible = false
		$deathAudio.play()
		$AnimationPlayer.play("death1_animation")
		await get_tree().create_timer(2).timeout
		$heart.texture = preload("res://resources/textures/heart3.png")
		$deathAudio.stream = preload("res://resources/sounds/death2.mp3")
		$deathAudio.play()
		await get_tree().create_timer(1).timeout
		$heart.visible = false
		await get_tree().create_timer(1).timeout
		$labelBox/text.text = "Пациент скончался."
		$labelBox/nextButton/nextButtonLabel.text = "Заново"
		$labelBox/backButton.visible = false
		$bookSound.play()
		$AnimationPlayer.play("death2_animation")
		return
	
	$penSound.play()
	btn.disabled = true
	btn.modulate.a = 0
	current_index += 1
	
	if current_index >= word_count:
		$teleportSound.play()
		$AnimationPlayer.play("end_animation")
		await $teleportSound.finished
		get_tree().change_scene_to_file("res://scenes/mindFall.tscn")
