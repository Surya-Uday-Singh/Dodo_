extends Label

var is_fading: bool = false
var is_pulsing: bool = true  # Flag to indicate pulsing state
var pulse_speed: float = 1.0  # Speed of the pulse effect
var pulse_direction: int = 1  # 1 for fading in, -1 for fading out

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_pulsing:
		var current_color = get_modulate()
		current_color.a += pulse_speed * pulse_direction * delta
		
		# Reverse direction when reaching full opacity or zero
		if current_color.a >= 1.0:
			current_color.a = 1.0
			pulse_direction = -1  # Start fading out
		elif current_color.a <= 0.0:
			current_color.a = 0.0
			pulse_direction = 1  # Start fading in

		set_modulate(current_color)
	
	if is_fading: 
		var current_color = get_modulate()
		current_color.a = lerp(current_color.a, 0.0, 0.1)
		set_modulate(current_color)
		
		if current_color.a <= 0.01:
			is_fading = false

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		fade_out()
		
func fade_out():
	is_fading = true
	is_pulsing = false  # Stop pulsing when fading out
