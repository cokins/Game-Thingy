extends "res://Item/Item.gd"

export (int) var DAMAGE

var can_use = true

func use():
	if can_use:
		$AttackRate.start()
		use_weapon()
		can_use = false

func use_weapon():
	# Implemented by child
	pass

func _on_AttackRate_timeout():
	$AttackRate.stop()
	can_use = true
