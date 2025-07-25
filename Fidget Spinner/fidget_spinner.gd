extends RigidBody2D

@onready var click_sound: AudioStreamPlayer = $ClickSound
@onready var spin_sound: AudioStreamPlayer = $SpinSound

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			apply_torque_impulse(10000)
			click_sound.play()
			spin_sound.play()
			spin_sound.volume_db += linear_to_db(0.05)

func _process(delta:float) -> void:
	# This checks if spin_sound is playing.
	if spin_sound.playing:
		# This adjusts the pitch scale.
		spin_sound.pitch_scale = 0.8 + 1.5 * (angular_velocity/29.67)
		# This sets the maximum volume to 1.
		spin_sound.volume_db = linear_to_db(min(1, (angular_velocity/24))) #29.67
	# This stops the spin_sound from playing after it's quiet enough.
	if spin_sound.volume_db < -44 and spin_sound.playing:
		spin_sound.stop()
