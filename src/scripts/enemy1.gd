extends Area2D
var cooldown = 1
var speed = 20
var player = null
var objettype = "enemy"

func _ready():
	cooldown += randi() % 5

func _physics_process(delta):	
	if cooldown > 0:
		cooldown -= 1 * delta
	else:
		if player == null:
			player = get_parent().get_node("player")
			
		var p = (player.position - self.position).normalized()
		position += p * speed * delta
