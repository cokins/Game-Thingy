extends Node

func add_item(item):
	item.equip()
	call_deferred("reparent", item)
	
func reparent(item):
	item.get_parent().remove_child(item)
	self.add_child(item)