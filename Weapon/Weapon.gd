extends Area2D

var equipped = false

func _ready():
	drop()

func equip():
	equipped = true
	$Equipped.show()
	$OnGround.hide()
	$OnGround/PickupBox.disabled = true
	# Once equipped to entities, positon should reset as it is
	# relative to the entity
	position = Vector2()
	
func drop():
	equipped = false
	$Equipped.hide()
	$OnGround.show()
	$OnGround/PickupBox.disabled = false

func _on_OnGround_area_shape_entered(area_id, area, area_shape, self_shape):
	if area.has_node("Inventory"):
		area.get_node("Inventory").add_item(self)