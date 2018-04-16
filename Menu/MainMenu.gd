extends Control

var NEW_GAME_WORLD = preload("res://World/Room/MainWorld.tscn")
var PLAYER = preload("res://Entities/Player.tscn")

func start_game():
	Transition.fade_in()
	var level = NEW_GAME_WORLD.instance()
	var player = PLAYER.instance()
	
	var root = get_parent()
	
	level.add_child(player)
	root.add_child(level)
	root.remove_child(self)
	
	Transition.fade_out()
	
func _input(event):
	# These key events only get called once
	if(event.is_action_pressed("drop")):
		start_game()


func _on_Button_pressed():
	start_game()
