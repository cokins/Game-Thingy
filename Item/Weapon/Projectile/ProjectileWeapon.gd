extends "res://Item/Weapon/Weapon.gd"


func use_weapon():
	var projectile_scene = get_projectile_scene()
	var n = projectile_scene.instance()
	add_child(n)
	
func get_projectile_scene():
	# Implemented by child
	pass