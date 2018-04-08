extends Node

var active_item = null

func add_item(item):
	item.pickup()
	active_item = item
	call_deferred("reparent", self, item)
	
func drop_active_item():
	if active_item:
		active_item.drop()
		var parent_entity = self.get_parent()
		var parent_map = parent_entity.get_parent()
		call_deferred("reparent", parent_map, active_item)
		call_deferred("select_first_item")
		
func select_first_item():
	if get_child_count() > 0:
		active_item = get_children()[0]
	else:
		active_item = null

func use_active_item():
	if active_item:
		active_item.use()
	
func reparent(new_parent, item):
	item.get_parent().remove_child(item)
	new_parent.add_child(item)
	item.set_owner(new_parent)