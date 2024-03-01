extends RigidBody2D

@onready var knife = $AnimatedSprite2D


func _ready():
	var mob_types = knife.sprite_frames.get_animation_names()
	knife.play(mob_types[randi() % mob_types.size()])

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
