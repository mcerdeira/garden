extends Area2D.
var objettype = "gun"

func _ready():
	$sprite.playing = true
	fix_face()

func _physics_process(delta):
	fix_face()
	
func fix_face():
	if get_parent().face_dir == "L":
		scale.x = -1
	if get_parent().face_dir == "R": 
		scale.x = 1
	if get_parent().face_dir == "U":
		rotation_degrees = 270
	if get_parent().face_dir == "D":
		rotation_degrees = 90

func _on_sprite_animation_finished():
	queue_free()

func _on_sword_area_entered(area):
	if area.objettype == "enemy":
		area.queue_free()
		queue_free()
