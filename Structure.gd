extends KinematicBody2D

var health = 100
var defense = 100

func damage(amount):
	if not amount:
		return
	print(self.name,": ouch")
	health -= amount
	if health <= 0:
		print(self.name,": Game over dude")
		queue_free()
	return defense
