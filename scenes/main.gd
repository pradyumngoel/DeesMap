extends Node2D

const AREA_DISPLAY = preload("res://scenes/map/area_display.tscn")
const PLANT_INFORMATION = preload("res://scenes/ui/plant_information.tscn")

func _ready() -> void:
	Events.mapAreaClicked.connect(show_area)
	Events.areaHide.connect(hide_area)
	Events.plantButtonPressed.connect(show_plant_information)
	
func show_area(area: MapArea) -> void:
	for i in %Area.get_children():
		i.queue_free()
		
	var new_area = AREA_DISPLAY.instantiate()
	%Area.add_child(new_area)
	Events.displayArea.emit(area)

func hide_area() -> void:
	for i in %Area.get_children():
		i.queue_free()
		
func show_plant_information(plant: Plant) -> void:
	for i in %Area.get_children():
		if i.has_method("set_plant_info"):
			i.queue_free()

	var plant_information_display = PLANT_INFORMATION.instantiate()
	plant_information_display.plant = plant
	%Area.add_child(plant_information_display)
	plant_information_display.set_plant_info(plant)
	plant_information_display.position = Vector2(50, 50)
	
