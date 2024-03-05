class_name Dialogue1_3
extends Control

@onready var learn_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Learn_Button as Button
@onready var defeat_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Defeat_Button as Button

@export var dialogue2 = preload("res://scenes/levels/level3/gluttony_dialogue/dialogue2.tscn") as PackedScene

func _ready():
	learn_button.button_down.connect(on_learn_pressed)
	defeat_button.button_down.connect(on_defeat_pressed)

func on_learn_pressed() -> void:
	get_tree().change_scene_to_packed(dialogue2)
	
func on_defeat_pressed() -> void:
	get_tree().change_scene_to_packed(dialogue2)

func _process(_delta):
	pass
