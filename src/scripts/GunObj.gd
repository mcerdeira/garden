extends Node

var cooldown = 0
var total_cooldown = 0
var damage = 1
var default_cooldown = 2
var default_damage = 1
var type = ""
var sword = null
var singlebullet = null

func preLoads():
	sword = preload("res://scenes/sword.tscn")
	singlebullet = preload("res://scenes/bullet.tscn")

func initialize(data):
	preLoads()
	self.name = data.name
	self.damage = data.damage
	self.total_cooldown = data.cooldown
	self.type = data.type

func damage_up(val):
	self.damage += val

func cooldown_down(val):
	self.total_cooldown -= val
	if self.total_cooldown <= 0:
		self.total_cooldown = 0.1

func shoot(delta, player):
	self.cooldown -= 1 * delta
	if self.cooldown <= 0:
		self.cooldown = self.total_cooldown
		doAction(player)
			
func doAction(player):
	if name == "sword":
		var w = sword.instance()
		w.set_position(Vector2(0, 0))
		player.add_child(w)
	if name == "singlebullet":
		var w = singlebullet.instance()
		player.get_parent().add_child(w)
		w.set_position(player.position)
