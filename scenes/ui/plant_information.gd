class_name PlantInformation
extends Control

@export var plant: Plant

func _on_close_button_pressed() -> void:
	queue_free()

func set_plant_info(this_plant: Plant) -> void:
	$PlantName.text = this_plant.plantName
	$Description.text = this_plant.plantDescription
	$TextureRect.texture = this_plant.plantIcon
