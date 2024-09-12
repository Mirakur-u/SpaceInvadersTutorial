extends Area2D

class_name Ufo

@export var speed = 200
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var shooting_point: Node2D = $ShootingPoint
const UFO_EXPLOSION = preload("res://Assets/Ufo/Ufo-explosion.png")


func _process(delta):
	position.x -= delta * speed


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area is Laser:
		area.queue_free()
		shooting_point.queue_free()
		speed = 0
		sprite_2d.texture = UFO_EXPLOSION
		await get_tree().create_timer(1.5).timeout
		queue_free()
