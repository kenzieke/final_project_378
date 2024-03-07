extends CharacterBody2D

signal hit
@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
@onready var sprite_2d = $Sprite2D
@onready var collision_shape_2d = $CollisionShape2D
var bullet_speed = 1000
var bullet = preload("res://scenes/levels/level3/moving_objects/pie_bullets.tscn")


func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		velocity.x += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("up"):
		velocity.y -= 1

	velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position.x = clamp(position.x, $Camera2D.limit_left, $Camera2D.limit_right)
	position.y = clamp(position.y, $Camera2D.limit_top, $Camera2D.limit_bottom)
			
	look_at(get_global_mouse_position())
	rotation = rotation + 90 
	
	if Input.is_action_just_pressed("LMB"):
		fire()

func fire():
	var bullet_instance = bullet.instantiate()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees - 90
	bullet_instance.linear_velocity = Vector2(bullet_speed,0).rotated(rotation - 90)
	get_tree().get_root().call_deferred("add_child", bullet_instance)
	
func restart_level():
	get_tree().reload_current_scene()

func _on_area_entered(area):
	print("area collide: ", area.name)
	if "Demons" in area.name:
		restart_level()
