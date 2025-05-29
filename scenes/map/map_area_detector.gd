class_name MapAreaDetector
extends Area2D

@export var area: MapArea

var mouse_in_area := false

func _on_mouse_entered() -> void:
	mouse_in_area = true

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("lmb") and mouse_in_area:
		Events.mapAreaClicked.emit(area)

func _on_mouse_exited() -> void:
	mouse_in_area = false
