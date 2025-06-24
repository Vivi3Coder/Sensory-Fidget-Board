extends Sprite2D

@onready var LightSwitchOff: AudioStreamPlayer = $LSoff
@onready var LightSwitchOn: AudioStreamPlayer = $LSon

func _on_switch_hitbox_toggled(toggled_on: bool) -> void:
	if toggled_on:
		LightSwitchOn.play()
		set_texture(load("res://Light Switch/NEWon.png"))
	else:
		LightSwitchOff.play()
		set_texture(load("res://Light Switch/NEWoff.png"))
