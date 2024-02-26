class_name Story2
extends Control

@onready var join_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Join_Button as Button
@onready var rule_button = $MarginContainer/HBoxContainer/VBoxContainer/HBoxContainer/Rule_Button as Button
@export var join_scene = preload("res://scenes/mainmenu/join_scene.tscn") as PackedScene
@export var rule_scene = preload("res://scenes/mainmenu/rule_scene.tscn") as PackedScene


func _ready():
	join_button.button_down.connect(on_join_pressed)
	rule_button.button_down.connect(on_rule_pressed)

func on_join_pressed() -> void:
	get_tree().change_scene_to_packed(join_scene)
	
func on_rule_pressed() -> void:
	get_tree().change_scene_to_packed(rule_scene)

func _process(_delta):
	pass
