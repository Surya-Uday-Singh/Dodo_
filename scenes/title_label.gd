extends Label

var is_fading: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
