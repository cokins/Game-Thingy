extends "res://Item/Weapon/Projectile/Ammo/Ammo.gd"
	
# TODO: Set direction
func _process(delta):
	var vel = direction.normalized() * SPEED
	position = position + vel * delta