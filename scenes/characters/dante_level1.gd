extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -700.0
@onready var dante = $AnimatableBody2D
@onready var walk_sound = $AudioStreamPlayer2D
@onready var jump_sound = $AudioStreamPlayer2D2
@export var end_game = preload("res://scenes/mainmenu/end_scene.tscn") as PackedScene 
var staff = 0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	
	if (velocity.x > 1 || velocity.x < -1):
		dante.animation = "walking"
		walk_sound.play()
		
	else:
		dante.animation = "idle"
	
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		dante.animation = "jumping"
		jump_sound.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	dante.flip_h = isLeft
	
			
func GetStaff():
	staff += 1
	print(staff)
	get_tree().change_scene_to_packed(end_game)
