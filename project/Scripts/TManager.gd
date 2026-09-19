extends Node2D

var TScale = Vector2.ZERO

func _ready():
	TScale = $Sprite.scale
	var tween = get_tree().create_tween()
	tween.set_loops()
	tween.tween_property($Sprite, "scale", Vector2(TScale * 1.1), 2.5)
	tween.tween_property($Sprite, "scale", Vector2(TScale * 0.9), 2.5)
