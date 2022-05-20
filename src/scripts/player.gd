extends KinematicBody2D
export var _speed = 50

func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	var moving = false
	
	if Input.is_action_pressed("down"):
		$sprite.animation = "down"
		position.y += _speed * delta
		moving = true
		
	if Input.is_action_pressed("up"):
		$sprite.animation = "up"
		position.y -= _speed * delta
		moving = true
		
	if Input.is_action_pressed("left"):
		$sprite.animation = "left"
		position.x -= _speed * delta
		moving = true
		
	if Input.is_action_pressed("right"):
		$sprite.animation = "right"
		position.x += _speed * delta
		moving = true
	
	$sprite.playing = moving
