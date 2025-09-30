extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_closed = true
@onready var zipper_sound: AudioStreamPlayer2D = $ZipperSoundEffect

func _on_button_pressed() -> void:
	if is_closed == true:
		animation_player.play("Open")
		is_closed = false
		zipper_sound.play(1.17)
	else:
		animation_player.play_backwards("Open")
		is_closed = true
		zipper_sound.play(0.5)
	
