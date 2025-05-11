class_name MainScript
extends Node

func _ready():
	var cursorTexture = load("res://ui/cursors/white/144.png")
	
	# Настройки курсора
	var hotspot = Vector2(8, 8)  # Точка "клика" (центр или остриё)
	
	# Вариант 1: Простая замена
	Input.set_custom_mouse_cursor(cursorTexture, Input.CURSOR_ARROW, hotspot)
