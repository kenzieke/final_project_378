class_name EndDialogue4
extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Start_Button as Button

@export var meet_sloth = preload("res://scenes/levels/level5/dialogue_level5/dialogue1_5.tscn") as PackedScene

func _ready():
	start_button.button_down.connect(on_start_pressed)
	
func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(meet_sloth)

func _process(_delta):
	pass
