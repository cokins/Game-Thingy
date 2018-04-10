extends "res://Item/Weapon/Weapon.gd"

export (PackedScene) var PROJECTILE
export (int) var SPEED

func use_weapon():
	var projectile_scene = PROJECTILE
	var n = projectile_scene.instance()
	n.set_damage(DAMAGE)
	n.set_speed(SPEED)
	# TODO: Set direction, default is <1, 0>
	
	# Add node to map
	n.position = get_position_on_map()
	get_map().add_child(n)
	
func get_projectile_scene():
	# Implemented by child
	pass