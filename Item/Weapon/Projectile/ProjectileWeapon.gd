extends "res://Item/Weapon/Weapon.gd"

export (PackedScene) var PROJECTILE

func use_weapon():
	var projectile_scene = PROJECTILE
	var n = projectile_scene.instance()
	n.set_damage(DAMAGE)
	# TODO: Set direction, default is <1, 0>
	add_child(n)
	
func get_projectile_scene():
	# Implemented by child
	pass