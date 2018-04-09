extends Node

var transitioning = false

func fade_in():
	get_node("AnimationPlayer").play("fade_in")
	
func fade_out():
	get_node("AnimationPlayer").play("fade_out")