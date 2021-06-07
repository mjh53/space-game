extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	connect('body_entered', get_parent(), 'movement')
	connect('body_exited', get_parent(), 'lost_movement')

func _draw():
	draw_arc(Vector2.ZERO, get_node("CollisionShape2D").shape.radius, 0, deg2rad(360), 60, Color8(255,0,0),1)
#	draw_circle(Vector2.ZERO, get_node("CollisionShape2D").shape.radius, Color8(255,0,0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
