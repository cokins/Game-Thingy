extends Area2D


export (int) var SPEED

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _process(delta):
    var velocity = Vector2() # the player's movement vector
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