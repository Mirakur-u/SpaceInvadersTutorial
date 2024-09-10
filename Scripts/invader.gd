extends Area2D

class_name Invader

var config: Resource
@onready var sprite_2d: Sprite2D = $Sprite2D


func _ready() -> void:
	sprite_2d.texture = config.sprite
	 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
