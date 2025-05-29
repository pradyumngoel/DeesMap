class_name SideList
extends Control

const SIDE_PLANT_LABEL = preload("res://scenes/ui/side_plant_label.tscn")

var button_group: ButtonGroup = ButtonGroup.new()

func _ready() -> void:
	Events.mapAreaClicked.connect(set_buttons)
	hide()

func set_buttons(area: MapArea) -> void:
	for button in %SideListContainer.get_children():
		button.queue_free()
	for plant in area.areaPlants:
		var button = SIDE_PLANT_LABEL.instantiate()
		%SideListContainer.add_child(button)
		button.setup(plant, button_group)
		
	show()

func _on_close_button_pressed() -> void:
	hide()
	Events.areaHide.emit()
