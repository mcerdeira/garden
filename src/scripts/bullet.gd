extends KinematicBody2D

export var speed : = 100.0
var velocity := Vector2()
var motion := Vector2()


func _ready():
	randomize()
	rotation = randi() % 360
	velocity = Vector2(speed,0).rotated(rotation)
	print(velocity)


func _process(delta):
	rotation_degrees += 200 * delta
	motion = move_and_slide(velocity)
