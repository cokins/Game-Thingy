extends Area2D


export (int) var SPEED

func _ready():
	$HitBox.disabled = false

func _process(delta):
    var velocity = Vector2() # the player's movement vector
	# Key events in _process will be called continously
    if Input.is_action_pressed("ui_accept"):
        $Inventory.use_active_item()
    if Input.is_action_pressed("ui_right"):
        velocity.x += 1
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
    if Input.is_action_pressed("ui_down"):
        velocity.y += 1
    if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
    if velocity.length() > 0:
        velocity = velocity.normalized() * SPEED
    position += velocity * delta

func _input(event):
	# These key events only get called once
	if(event.is_action_pressed("drop")):
		$Inventory.drop_active_item()