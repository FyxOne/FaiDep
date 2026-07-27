extends Node

var timer_running = false
var elapsed_time = 0.0

var music_player: AudioStreamPlayer
var current_track = "track1"
var current_scene = "menu"
var obsession = 1.0  

func _ready():
	Global.set_scene("menu")
	music_player = AudioStreamPlayer.new()
	add_child(music_player)
	music_player.volume_db = -20
	play_track("track1")

func _process(delta):
	if timer_running:
		elapsed_time += delta
	
	update_music()

func update_music():
	var target_track = current_track
	
	if current_scene == "siege":
		if obsession <= 0.25:
			target_track = "track3"
		else:
			target_track = "track2"
	elif current_scene == "victory":
		target_track = "track3"
	elif current_scene == "defeat":
		target_track = "track1"
	else:
		target_track = "track1"
	
	if target_track != current_track:
		play_track(target_track)

func set_scene(scene_name: String):
	current_scene = scene_name
	update_music()

func set_obsession(value: float):
	obsession = value
	update_music()

func play_track(track_name):
	var track_path = "res://resources/music/" + track_name + ".mp3"
	var stream = load(track_path)
	
	stream.loop = true
	
	music_player.stop()
	music_player.stream = stream
	music_player.play()
	current_track = track_name

func play_track1():
	play_track("track1")

func play_track2():
	play_track("track2")

func play_track3():
	play_track("track3")

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_F11 and event.pressed and not event.echo:
			toggle_fullscreen()

func toggle_fullscreen():
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
