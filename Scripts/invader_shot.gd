extends Area2D

class_name InvaderShot

@export var speed = 200
@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

func _process(delta: float) -> void:
	position.y += speed * delta


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
	
	


func _on_area_entered(area: Area2D) -> void:
	(area as Player).on_player_destroyed()
	queue_free()
