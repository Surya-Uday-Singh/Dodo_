extends Node2D

var rand_x
var rand_y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#spawn obstacles
	randomize()
	for i in range(80):
		var tree = preload("res://scenes/Tree.tscn").instantiate()
		
		rand_x = randi_range(-200, 200)
		rand_y = randi_range(-520, 450)
		tree.global_position = Vector2(rand_x, rand_y)
		add_child(tree)
			
	randomize()
	for i in range(20):
		var rock = preload("res://scenes/stone.tscn").instantiate()
		rand_x = randi_range(-300, 400)
		rand_y = randi_range(-520, 450)
		rock.global_position = Vector2(rand_x, rand_y)
		add_child(rock)
		
	randomize()
	for i in range(60):
		var volcano_tree = preload("res://scenes/VolcanoTree.tscn").instantiate()
		rand_x = randi_range(-820, -350)
		rand_y = randi_range(-520, 450)
		volcano_tree.global_position = Vector2(rand_x, rand_y)
		add_child(volcano_tree)
	
	randomize()
	for i in range(80):
		var volcano_rock = preload("res://scenes/VolcanoRock.tscn").instantiate()
		rand_x = randi_range(-900, -350)
		rand_y = randi_range(-520, 450)
		volcano_rock.global_position = Vector2(rand_x, rand_y)
		add_child(volcano_rock)
	
	randomize()
	for i in range(50):
		var cactus = preload("res://scenes/Cactus.tscn").instantiate()
		rand_x = randi_range(300, 800)
		rand_y = randi_range(-520, 450)
		cactus.global_position = Vector2(rand_x, rand_y)
		add_child(cactus)
	
	randomize()
	for i in range(80):
		var grass = preload("res://scenes/grass.tscn").instantiate()
		rand_x = randi_range(300, 800)
		rand_y = randi_range(-520, 450)
		grass.global_position = Vector2(rand_x, rand_y)
		add_child(grass)
		
	#spawn trash
	var total_trash = randi_range(50, 200)
	for i in total_trash:
		var trash = preload("res://scenes/trash.tscn").instantiate()
		rand_x = randi_range(-850, 780)
		rand_y = randi_range(-520, 450)
		trash.global_position = Vector2(rand_x, rand_y)
		add_child(trash)		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
