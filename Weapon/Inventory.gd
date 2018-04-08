extends Node

var active_item = null

func add_item(item):
	item.equip()
	active_item = item
	call_deferred("reparent", self, item)
	
func drop_active_item():
	if active_item:
		active_item.drop()
		var parent_entity = self.get_parent()
		var parent_map = parent_entity.get_parent()
		call_deferred("reparent", parent_map, active_item)
		active_item = null
	
func reparent(new_parent, item):
	item.get_parent().remove_child(item)
	new_parent.add_child(item)