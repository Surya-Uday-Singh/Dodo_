extends Label

var time_left = 300  # Starting time in seconds
var timer: Timer
var timer_started = false  # Flag to track if timer has been started

func _ready():
	# Create and configure the Timer node
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 1  # 1 second intervals
	timer.one_shot = false  # Make it repeat
	
	# Connect the timeout signal to our countdown function
	timer.timeout.connect(_on_timer_timeout)
	
	# Update the initial text
	text = str(time_left)

func _input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed and not timer_started:
		timer_started = true  # Set flag to prevent restarting
		timer.start()

func _on_timer_timeout():
	time_left -= 1
	text = str(time_left)
	
	if time_left <= 0:
		timer.stop()
		timer_started = false  # Reset flag when timer stops
		game_over()

func game_over():
	# Display "Time's Up!"
	text = "Time's Up!"
	
	# Pause the game
	get_tree().paused = true
