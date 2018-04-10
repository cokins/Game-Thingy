extends Area2D

var damage = 0 setget set_damage
var direction = Vector2(1, 0) setget set_direction
var speed = 10 setget set_speed

func set_damage(d):
	damage = d
	
func set_direction(d):
	direction = d
	
func set_speed(s):
	speed = s