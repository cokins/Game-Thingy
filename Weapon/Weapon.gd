extends Area2D

export (int) var DAMAGE
export (int) var ATTACK_RATE

var equipped = false

func _ready():
	init_drop()

func init_drop():
	equipped = false
	$Equipped.hide()
	$OnGround.show()
	$OnGround/PickupBox.disabled = false
	
func init_equip():
	equipped = true
	$Equipped.show()
	$OnGround.hide()
	$OnGround/PickupBox.disabled = true

func equip():
	init_equip()
	# Once equipped to entities, positon should reset as it is
	# relative to the entity
	position = Vector2()
	
func drop():
	init_drop()
	# Since we're dropping this we should copy the parent's
	# current position, since it'll be relative to the map
	var inventory = self.get_parent()
	var parent = inventory.get_parent()
	# TODO: Make drop location an attribute of the parent
	position = Vector2(parent.position.x + 17, parent.position.y)

func _on_OnGround_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.has_node("Inventory"):
		area.get_node("Inventory").add_item(self)