extends "Structure.gd"

var size=20

var current_target = null
var possible_targets = []
onready var firezone = get_node('Firezone')
var color = Color(1,1,1,1)

var direction = Vector2(0,0)
onready var weapon = get_node('Laser')

# Called when the node enters the scene tree for the first time.
func _ready():
	firezone.get_node("CollisionShape2D").shape.radius = weapon.weapon_range
	add_to_group('player')
	weapon.firing = false
	weapon.position=Vector2(0,-(size+1))
	
func _physics_process(delta):
	if current_target:
		direction = (current_target.global_position - global_position).normalized()
		rotation=direction.angle()+PI/2
		

func _draw():
	draw_arc(Vector2.ZERO, size, 0, deg2rad(360), 60, color, 1 )
	draw_circle(Vector2.ZERO, 10, color)
	draw_line(Vector2.ZERO, Vector2(0,-size), color, 1)

func movement(obj):
	if obj == self:
		return
	print("turret detected: ",obj.name)
	
	if obj.is_in_group('enemies'):
		possible_targets.append(obj)
		print("bang bang")
		weapon.firing=true
		current_target=obj
	
func lost_movement(obj):
	print("turret lost ",obj.name)
	current_target = null
	weapon.firing = false
	pass

