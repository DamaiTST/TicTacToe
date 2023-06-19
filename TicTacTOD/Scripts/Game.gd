extends Node

var grid_array = [0,0,0,0,0,0,0,0,0]
var win = false
var p1 = true
var click_delay = 100
var turn = 0
var pos_choosen = [false,false,false,false,false,false,false,false,false]

onready var ShowsWin = preload("res://Scene/ShowsWin.tscn")

func _ready():
	pass # Replace with function body.

func checkwin():
	for i in range(0,3):
		var row_value = 0
		var column_value = 0
		var diagonal_value = 0
		
		for j in range(0,3):
			row_value += (grid_array[(i*3 + j)])
			column_value += (grid_array[i + (j*3)])
			diagonal_value += (grid_array[(2-i) + ((j*2) + ((j*2)*i/2))])

		if(row_value == 3 or row_value == -3):
			grid_array = [0,0,0,0,0,0,0,0,0]
			win = true
			for k in range(0,3):
				pos_choosen[i*3 + k] = true
		elif(column_value == 3 or column_value == -3):
			grid_array = [0,0,0,0,0,0,0,0,0]
			win = true
			for k in range(0,3):
				pos_choosen[i + (k*3)] = true
		elif(i != 1 and (diagonal_value == 3 or diagonal_value == -3)):
			grid_array = [0,0,0,0,0,0,0,0,0]
			win = true
			for k in range(0,3):
				pos_choosen[(2-i) + ((k*2) + ((k*2)*i/2))] = true
		else:
			p1 = !p1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(click_delay <= 0 and (win or turn > 8)):
		get_tree().reload_current_scene()
		win = false
		turn = 0
		click_delay = 100
		for i in range(0,9):
			pos_choosen[i] = false
			grid_array[i] = 0
	elif(win or turn > 8):
		click_delay -= 1
