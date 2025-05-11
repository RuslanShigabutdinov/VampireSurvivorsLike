class_name Gun
extends Node2D

const WEAPON_RADIUS = 20

@onready var weapon: Sprite2D = $Sprite2D

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - global_position).normalized()
	
	# Позиция по кругу
	weapon.position = direction * WEAPON_RADIUS
	
	# Поворот в сторону курсора
	weapon.rotation = direction.angle()
