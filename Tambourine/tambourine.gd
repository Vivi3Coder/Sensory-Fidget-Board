extends Node2D
@onready var tambourine_sound_effect: AudioStreamPlayer = $TambourineSoundEffect
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_button_pressed() -> void:
	tambourine_sound_effect.play()
	animation_player.play("Shake")
	

func _on_tambourine_sound_effect_finished() -> void:
	animation_player.stop()
