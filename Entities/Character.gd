extends Area2D
export (int) var SPEED

var tile_size = 16
var can_move = true
var facing = 'down'
var moves = {'right': Vector2(1, 0),
              'left': Vector2(-1, 0),
			  'up': Vector2(0, -1),
			  'down': Vector2(0, 1)}

var raycasts = {'right': 'ray_right',
              'left': 'ray_left',
			  'up': 'ray_up',
			  'down': 'ray_down'}
			
func move(direction):
	print('I AM HERE')
	facing = direction
#	if get_node(raycasts[facing]).is_colliding():
#        return
	$AnimationPlayer.play(facing)
#	$MoveTween.interpolate_property(self, 'position', position,
#	                                position + moves[facing] * tile_size, 0.8,
#									Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	position = position + moves[facing] * SPEED
	return true
			


#func _ready():
#	$HitBox.disabled = false

#func _process(delta):
#    var velocity = Vector2() # the player's movement vector
#	# Key events in _process will be called continously
#    if Input.is_action_pressed("ui_accept"):
#        $Inventory.use_active_item()
#    if Input.is_action_pressed("ui_right"):
#        velocity.x += 1
#    if Input.is_action_pressed("ui_left"):
#        velocity.x -= 1
#    if Input.is_action_pressed("ui_down"):
#        velocity.y += 1
#    if Input.is_action_pressed("ui_up"):
#        velocity.y -= 1
#    if velocity.length() > 0:
#        velocity = velocity.normalized() * SPEED
#    position += velocity * delta
#
#func _input(event):
#	# These key events only get called once
#	if(event.is_action_pressed("drop")):
#		$Inventory.drop_active_item()

func _on_MoveTween_tween_completed(object, key):
	can_move = true
