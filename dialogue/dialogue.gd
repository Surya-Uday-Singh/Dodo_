extends Control

signal diaglogue_is_finished

@export_file("*.json") var d_file

var dialogue = []
var current_dialogue_id
var d_active = false

func _ready():
	$NinePatchRect.visible = false
	
	
func start():
	if d_active:
		return
	d_active = true
	$NinePatchRect.visible = true
	dialogue = load_dialogue()
	current_dialogue_id = -1
	next_script()

func load_dialogue():
		var file = FileAccess.open("res://dialogue/dialogue-npc.json", FileAccess.READ)
		var content = JSON.parse_string(file.get_as_text())
		return content
	
func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()
		
func next_script():
	current_dialogue_id += 1
	if current_dialogue_id  >= len(dialogue):
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("diaglogue_is_finished")
		return 
	if current_dialogue_id%2 == 0:
		$AudioGuy.play()
	else:
		$AudioDodo.play()
		
	
	$NinePatchRect/Name.text = dialogue[current_dialogue_id]['name'] 
	$NinePatchRect/Text.text = dialogue[current_dialogue_id]['text']
	
