extends Node2D

var active_tab: String = "history"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Languages.translate_all(self)
	
	$historyTab.button_pressed = true
	$dossierTab.button_pressed = false
	$organizationTab.button_pressed = false
	
	$historyTab/historyTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
	$dossierTab/dossierTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	$organizationTab/organizationTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	
	$history.visible = true
	$dossier.visible = false
	$organization.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_history_tab_button_down() -> void:
	$historyTab/historyTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
	
	$dossierTab.button_pressed = false
	$dossierTab/dossierTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	$organizationTab.button_pressed = false
	$organizationTab/organizationTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	
	show_tab("history")

func _on_dossier_tab_button_down() -> void:
	$dossierTab/dossierTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
	
	$historyTab.button_pressed = false
	$historyTab/historyTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	$organizationTab.button_pressed = false
	$organizationTab/organizationTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	
	show_tab("dossier")

func _on_organization_tab_button_down() -> void:
	$organizationTab/organizationTabLabel.add_theme_color_override("font_color", Color("#ffff64"))
	
	$historyTab.button_pressed = false
	$historyTab/historyTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	$dossierTab.button_pressed = false
	$dossierTab/dossierTabLabel.add_theme_color_override("font_color", Color("#ffaf5f"))
	
	show_tab("organization")

func _on_home_tab_button_up() -> void:
	$homeTab/homeArrow.texture = load("res://resources/textures/arrow_pressed.png")
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_home_tab_button_down() -> void:
	$homeTab/homeArrow.texture = load("res://resources/textures/arrow.png")
	
func show_tab(tab):
	if tab == "history":
		$history.visible = true
		$dossier.visible = false
		$organization.visible = false
	elif tab == "dossier":
		$history.visible = false
		$dossier.visible = true
		$organization.visible = false
	elif tab == "organization":
		$history.visible = false
		$dossier.visible = false
		$organization.visible = true
