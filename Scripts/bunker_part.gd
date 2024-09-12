extends Area2D

class_name BunkerPart

@export var sprite: Sprite2D
@export var texture_array: Array[Texture2D]

var damage = 0
const MAX_DAMAGE = 3

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)
	
	
func _on_area_entered(area):
	if area is Laser || area is InvaderShot:
		area.queue_free()
		if damage < MAX_DAMAGE:
			damage += 1
			sprite.texture = texture_array[damage-1]
		else:
			queue_free()
	
	if area is Invader:
		queue_free()
