extends Area2D

export (int) var SPEED

var damage = 0 setget set_damage
var direction = Vector2(1, 0) setget set_direction

func set_damage(d):
	damage = d
	
func set_direction(d):
	direction = d