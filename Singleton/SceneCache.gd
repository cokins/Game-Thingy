extends Node

var cache = {}

func cache_scene(name, scene):
	cache[name] = scene
	pass
	
func get_scene(name):
	if name in cache:
	  return cache[name]
	return null