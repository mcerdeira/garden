extends Area2D
export var _speed = 55
var face_dir = "R"
var objettype = "player"

func _ready():
	pass
	
func _physics_process(delta):
	for g in Global.EQUIPED_GUNS:
		g.shoot(delta, self)
	
	var moving = false
	
	if Input.is_action_pressed("down"):
		$sprite.animation = "down"
		face_dir = "D"
		position.y += _speed * delta
		moving = true
		
	elif Input.is_action_pressed("up"):
		$sprite.animation = "up"
		face_dir = "U"
		position.y -= _speed * delta
		moving = true
		
	elif Input.is_action_pressed("left"):
		$sprite.animation = "left"
		face_dir = "L"
		position.x -= _speed * delta
		moving = true
		
	elif Input.is_action_pressed("right"):
		$sprite.animation = "right"
		face_dir = "R"
		position.x += _speed * delta
		moving = true
	
	$sprite.playing = moving
