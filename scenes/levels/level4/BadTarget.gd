extends Area2D

var winsize;
var clicked = false
var mouse_targeted = false
var bounds_x
var bounds_y

# Called when the node enters the scene tree for the first time.
func _ready():
	winsize = get_viewport().get_visible_rect().size
	bounds_x = Vector2(0 - winsize.x / 2 + 50, winsize.x / 2 - 50)
	bounds_y = Vector2(0 - winsize.y / 2 + 50, winsize.y / 2 - 50)
	var new_pos = Vector2(randi_range(bounds_x.x, bounds_x.y), randi_range(bounds_y.x, bounds_y.y))
	position = new_pos;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and mouse_targeted:
			var new_pos = Vector2(randi_range(bounds_x.x, bounds_x.y), randi_range(bounds_y.x, bounds_y.y))
			position = new_pos;
			global.lives -= 1
			print("Don't kill friendlies! Lives: ", global.lives)
			if global.lives <= 0:
				# TODO: reload scene/restart level
				print("You died!")

func _on_mouse_entered():
	mouse_targeted = true

func _on_mouse_exited():
	mouse_targeted = false
