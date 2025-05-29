class_name SidePlantLabel
extends HBoxContainer

var hovering := false
var this_plant: Plant

func setup(plant, button_group) -> void:
	var side_plant_button: Button = $SidePlantButton
	side_plant_button.icon = plant.plantIcon
	side_plant_button.text = plant.plantName
	side_plant_button.button_group = button_group
	
	this_plant = plant


func _on_button_mouse_entered() -> void:
	hovering = true
	Events.plantLabelButtonHovered.emit(this_plant)

func _on_button_mouse_exited() -> void:
	hovering = false
	Events.plantLabelButtonUnhovered.emit(this_plant)

func _on_side_plant_button_pressed() -> void:
	Events.plantButtonPressed.emit(this_plant)
