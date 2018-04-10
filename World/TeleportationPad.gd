extends Area2D

export(String, FILE, "*.tscn") var DESTINATION_ROOM_FILE
export(String) var DESTINATION_TELEPORT_NAME
export(String) var SPAWN_POINT_NAME = 'SpawnPoint'

var teleporting = false

func teleport(player):
	Transition.fade_in()
	
	# Get the parent container of the current room
	var room = get_parent()
	var container = room.get_parent()
	
	# Load the level
	var destination = SceneCache.get_scene(DESTINATION_ROOM_FILE)
	if !destination:
		destination = load(DESTINATION_ROOM_FILE).instance()
		SceneCache.cache_scene(DESTINATION_ROOM_FILE, destination)

	# Load the teleport
	var teleport = destination.get_node(DESTINATION_TELEPORT_NAME)
	
	# Find the SpawnPoint
	var spawn_point = teleport.get_node(SPAWN_POINT_NAME)
	
	# At this point, if we haven't thrown an exception
	# we can attempt to change the level

	
	# Remove the player from the current room
	room.remove_child(player)
	
	# Remove our room, and add the new destination room
	container.remove_child(room)
	container.add_child(destination)
	destination.set_owner(container)
	
	# Add the player to the new room
	destination.add_child(player)
	
	# Set player position according to spawn point
	player.position = teleport.position + spawn_point.position
	
	Transition.fade_out()
	Transition.transitioning = false

func _on_TeleportationPad_area_shape_entered(area_id, area, area_shape, self_shape):
	if Transition.transitioning:
		return

	if area && "name" in area && area.name == 'Player':
		Transition.transitioning = true
		call_deferred("teleport", area)
