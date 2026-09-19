extends Node2D

var TScale = Vector2.ZERO
var Grab = true
var ToGrab = 0
var IdleTween

func _ready():
	IdleTween = get_tree().create_tween()
	TScale = $Sprite.scale
	IdleTween.set_loops()
	IdleTween.tween_property($Sprite, "scale", Vector2(TScale * 1.05), 2.5)
	IdleTween.tween_property($Sprite, "scale", Vector2(TScale * 0.95), 2.5)
	
func _physics_process(delta: float) -> void:
	if(Grab == false):
		IdleTween.pause()
		ToGrab +=1
		if(ToGrab >= 120):
			ToGrab = 0
			Grab = true
			IdleTween.play()
