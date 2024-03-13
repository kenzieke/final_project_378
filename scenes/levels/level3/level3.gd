extends Node2D

@export var devora_after_scene = preload("res://scenes/levels/level3/gluttony_dialogue/devora_post_game.tscn") as PackedScene

func _ready():
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.tile_set.tile_size
	$DanteLevel3/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$DanteLevel3/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$DanteLevel3/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$DanteLevel3/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y

func _process(delta):
	if global.level3_bats <= 0:
		print("GAME OVER!!!!")
		get_tree().change_scene_to_packed(devora_after_scene)

