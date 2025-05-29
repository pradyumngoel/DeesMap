class_name PlantDisplay
extends Control

@export var plant: Plant

@onready var texture_rect: TextureRect = $TextureRect

func set_display(texture) -> void:
	texture_rect = $TextureRect
	texture_rect.texture = texture

func _on_plant_hover() -> void:
	#Make this golden effect
	hide()

func _on_plant_unhover() -> void:
	show()
