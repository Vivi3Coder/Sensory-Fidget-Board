extends Node2D

var buttons = []
var current_index = 0

@onready var click_sound: AudioStreamPlayer = $ClickSound

func _ready() -> void:
	var nodes = self.get_children()
	for node in nodes:
		if node is Sprite2D:
			buttons.append(node)
			node.hide()
		
	buttons[0].show()

func _on_button_pressed() -> void:
	click_sound.play()

	buttons[current_index].hide()
	current_index += 1	
	if current_index >= 9:
		current_index = 0
	buttons[current_index].show()
