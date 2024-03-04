extends Area2D

var winsize;
var clicked = false
var mouse_targeted = false

# Called when the node enters the scene tree for the first time.
func _ready():
	winsize = get_viewport().get_visible_rect().size
	var new_pos = Vector2(randi_range(0 - winsize.x / 2, winsize.x / 2), randi_range(0 - winsize.y / 2, winsize.y / 2))
	position = new_pos;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += randi_range(-1, 1)
	position.y += randi_range(-1, 1)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and mouse_targeted:
			var new_pos = Vector2(randi_range(0 - winsize.x / 2, winsize.x / 2), randi_range(0 - winsize.y / 2, winsize.y / 2))
			position = new_pos;

func _on_mouse_entered():
	mouse_targeted = true

func _on_mouse_exited():
	mouse_targeted = false
