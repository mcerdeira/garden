extends Node

var cooldown = 0
var total_cooldown = 0
var damage = 1
var default_cooldown = 2
var default_damage = 1

func initialize(data):
	self.name = data.name
	self.damage = data.damage
	self.total_cooldown = data.cooldown

func damage_up(val):
	self.damage += val

func cooldown_down(val):
	self.total_cooldown -= val
	if self.total_cooldown <= 0:
		self.total_cooldown = 0.1

func shoot(delta):
	self.cooldown -= 1 * delta
	if self.cooldown <= 0:
		self.cooldown = self.total_cooldown
		doAction()
			
func doAction():
	pass
	#print("SHOOT >" + self.name + " >> " + str(self.damage))
	

