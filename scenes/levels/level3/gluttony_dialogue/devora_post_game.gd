class_name DevoraPostGame
extends Control

@onready var question_1_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question1_Button as Button
@onready var question_2_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question2_Button as Button

@export var in_hell_devora1 = preload("res://scenes/levels/level3/gluttony_dialogue/in_hell_devora1.tscn") as PackedScene
@export var know_meph_devora = preload("res://scenes/levels/level3/gluttony_dialogue/know_meph_devora.tscn") as PackedScene

func _ready():
	question_1_button.button_down.connect(on_hell_devora_pressed)
	question_2_button.button_down.connect(on_know_meph_devora)

func on_hell_devora_pressed() -> void:
	get_tree().change_scene_to_packed(in_hell_devora1)
	
func on_know_meph_devora() -> void:
	get_tree().change_scene_to_packed(know_meph_devora)

func _process(_delta):
	pass
