extends Area2D

const SPEED = 50
var velocity = Vector2()
@onready var bat = $AnimatedSprite2D

func _physics_process(delta):
	bat.flip_h = true
	
	var DanteLevel3 = get_parent().get_node("DanteLevel3")
	position += ((DanteLevel3.position - position)/100) * SPEED * delta
	look_at(DanteLevel3.position)

func _on_area_entered(area):
	if "BulletArea" in area.name:
		queue_free()
		global.level3_bats -= 1
