extends Area2D

onready var x = preload("res://Assets/cross.png")
onready var o = preload("res://Assets/circle.png")
var selected = false
export var pos = -1

func _ready():
	$mouse_over.hide()

func _on_POS_mouse_entered():
	if(!selected and !Game.win):
		$mouse_over.show()

func _on_POS_mouse_exited():
	$mouse_over.hide()

func play_x():
	if(!selected and !Game.win):
		$x_o.set_texture(x)
		Game.grid_array[pos] = 1
		Game.turn += 1
		Game.checkwin()
		print(Game.turn)

func play_o():
	if(!selected and !Game.win):
		$x_o.set_texture(o)
		Game.grid_array[pos] = -1
		Game.turn += 1
		Game.checkwin()
		print(Game.turn)

func _on_POS_input_event(viewport, event, shape_idx):
	if(event is InputEventMouseButton):
		if(event.button_index == BUTTON_LEFT):
			if(Game.p1):
				play_x()
				$mouse_over.hide()
				selected = true
			else:
				play_o()
				$mouse_over.hide()
				selected = true

func _process(delta):
	if(Game.pos_choosen[pos]):
		$x_o/AnimationPlayer.play("blink")
