class_name FirstQuestionScene
extends Control

@onready var hell_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question1_Button as Button
@onready var know_meph_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Question2_Button as Button
@export var in_hell = preload("res://scenes/levels/level2/dialogue_scenes/in_hell_scene.tscn") as PackedScene
@export var know_meph = preload("res://scenes/levels/level2/dialogue_scenes/know_meph.tscn") as PackedScene

func _ready():
	hell_button.button_down.connect(on_hell_button_pressed)
	know_meph_button.button_down.connect(on_know_meph_button_pressed)

func on_hell_button_pressed() -> void:
	get_tree().change_scene_to_packed(in_hell)
	
func on_know_meph_button_pressed() -> void:
	get_tree().change_scene_to_packed(know_meph)

func _process(_delta):
	pass
