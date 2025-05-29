class_name AreaDisplay
extends Control

const PLANT_DISPLAY = preload("res://scenes/display/plant_display.tscn")
@onready var plants: Node2D = $Plants

func _ready() -> void:
	Events.displayArea.connect(display_area)
	
	Events.plantLabelButtonHovered.connect(hover_plant)
	Events.plantLabelButtonUnhovered.connect(unhover_plant)
	
func display_area(area: MapArea) -> void:
	for plant in area.areaPlants:
		var plant_display = PLANT_DISPLAY.instantiate()
		plant_display.position = plant.plantPos
		plants.add_child(plant_display)
		plant_display.set_display(plant.plantIcon)
		
		plant_display.plant = plant

func hover_plant(target_plant) -> void:
	for plant: PlantDisplay in plants.get_children():
		if plant.plant == target_plant:
			plant._on_plant_hover()
			break
			
func unhover_plant(target_plant) -> void:
	for plant: PlantDisplay in plants.get_children():
		if plant.plant == target_plant:
			plant._on_plant_unhover()
			break
