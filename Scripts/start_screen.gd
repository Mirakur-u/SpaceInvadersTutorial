extends CanvasLayer

@onready var invader_1_texture: TextureRect = $MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/InvaderContainer_1/Invader1Texture
@onready var invader_1_label: Label = $MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/InvaderContainer_1/Invader1Label
@onready var invader_2_texture: TextureRect = $MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/InvaderContainer_2/Invader2Texture
@onready var invader_2_label: Label = $MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/InvaderContainer_2/Invader2Label
@onready var invader_3_texture: TextureRect = $MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/InvaderContainer_3/Invader3Texture
@onready var invader_3_label: Label = $MarginContainer/VBoxContainer/VBoxContainer2/VBoxContainer/InvaderContainer_3/Invader3Label
@onready var timer: Timer = $Timer

var control_array = []

func _ready() -> void:
	control_array.append_array([invader_1_texture, invader_1_label, invader_2_texture, invader_2_label, invader_3_texture, invader_3_label])
	
	for control in control_array:
		(control as Control).modulate = Color.TRANSPARENT

func load_game() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")





func show_next_control() -> void:
	var control = control_array.pop_front() as Control
	if control != null:
		control.modulate = Color.ALICE_BLUE
	else:
		timer.stop()
		timer.queue_free()
