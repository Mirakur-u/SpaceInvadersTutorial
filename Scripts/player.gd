extends Area2D

class_name Player

signal player_destroyed

@export var speed = 200
var direction = Vector2.ZERO

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var bounding_size_x 
var start_bound
var end_bound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bounding_size_x = collision_shape_2d.shape.get_rect().size.x / 2
	var rect = get_viewport().get_visible_rect()
	var camera = get_viewport().get_camera_2d()
	var camera_position = camera.position
	
	start_bound = (camera_position.x - rect.size.x) / 2
	end_bound = (camera.position.x + rect.size.x) / 2
	
func _process(delta: float) -> void:
	var input = Input.get_axis("move_left","move_right")
	if input>0:
		direction = Vector2.RIGHT
	elif input<0:
		direction = Vector2.LEFT
	else:
		direction = Vector2.ZERO
	
	
	var delta_movement = direction * speed * delta
	
	# are we going out of screen bounds?
	if (position.x + delta_movement.x < start_bound + bounding_size_x * transform.get_scale().x || 
		position.x + delta_movement.x > end_bound -  bounding_size_x * transform.get_scale().x):
		return
	
	
	position.x += delta_movement.x
	

func on_player_destroyed():
	speed = 0
	animation_player.play("destroy")


#func _on_area_entered(area: Area2D) -> void:
#	if area is InvaderShot:
#		on_player_destroyed()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "destroy":
		await get_tree().create_timer(1).timeout
		player_destroyed.emit()
		queue_free()
