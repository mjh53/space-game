extends "Structure.gd"

var target = null
var speed = 200
var strength = 10
var direction


# Called when the node enters the scene tree for the first time.
func _ready():
	health = 50
	add_to_group('enemies')
	var targets = get_tree().get_nodes_in_group('player')
	print(targets)
	print("fioosh")
	if targets.size():
		target = targets[randi() % targets.size()]
		set_target(target)
		
func set_target(target):
	if target:
		self.target = target
		direction = (target.global_position - global_position).normalized()
	
	
func _physics_process(delta):
	# move toward target
		var velocity = direction * speed
		var collision = move_and_collide(velocity * delta)
		if collision:
			var obj = collision.collider
			print("Hit ",obj.name)
			if obj.is_in_group('player'):
				print("and it's a player object")
				if obj.has_method('damage'):
					var retaliation = obj.damage(strength)
					self.damage(retaliation)
				else:
					print("No fair! immune")

