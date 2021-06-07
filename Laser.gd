extends Node2D

var firing = false setget set_firing
var target = null
export var weapon_range := 200 setget set_weapon_range
onready var beam = $Beam
onready var loader = $Reload

var dps = 100
var cycle = 0.1
var pulse = dps * cycle

func _ready():
	
	loader.wait_time = cycle
	loader.start()
	firing = true
	
func _process(delta):
	update()
	
func _draw():
	if firing:
		if beam.is_colliding():
			draw_line(Vector2.ZERO, beam.get_collision_point(), Color(1,1,1,1), 2)
		else:
			draw_line(Vector2.ZERO, beam.cast_to, Color(1,0,1,1), 1)
	
func _on_Reload_timeout():
	if firing:
		print("Firing")
		if beam.is_colliding():
			print("hitting:",beam.is_colliding().name)
		
func set_weapon_range(dist):
	weapon_range = dist
	beam.cast_to = Vector2(0,weapon_range)
	
func set_firing(state):
	firing = state
	if firing:
		print(self.name,": firing now")
	else:
		print(self.name,": stopping")
