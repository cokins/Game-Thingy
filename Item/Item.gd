extends Node2D

var in_inventory = false

func _ready():
	set_drop_state()

func set_drop_state():
	in_inventory = false
	$Equipped.hide()
	$OnGround.show()
	
func set_pickup_state():
	in_inventory = true
	$Equipped.show()
	$OnGround.hide()
	position = Vector2()

func pickup():
	set_pickup_state()
	
func drop():
	var parent = get_inventory_parent()
	# Can't drop something that isn't picked up.
	if parent:
		set_drop_state()
		# Since we're dropping this we should copy the parent's
		# current position, since it'll be relative to the map
		# TODO: Make drop location an attribute of the parent
		position = Vector2(parent.position.x + 17, parent.position.y)
	
func get_inventory_parent():
	if in_inventory:
		# ASSUMPTION: inventory's direct parent is the entity
		var inventory = self.get_parent()
		return inventory.get_parent()
	else:
		return null
		
func get_entity_inventory(entity):
	if entity.has_node("Inventory"):
		return entity.get_node("Inventory")
	else:
		return null
	
func use():
	# Implemented by child Scenes
	pass

func _on_OnGround_area_shape_entered(area_id, area, area_shape, self_shape):
	if !in_inventory:
		var inventory = get_entity_inventory(area)
		if inventory:
			inventory.add_item(self)