extends Node2D

#Not sure this will work
@onready var anim = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("idle")

func play_anim(animation_name) -> void:
	anim.play(animation_name)
	
func stop_anim() -> void:
	anim.stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
