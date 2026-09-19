extends Node2D

var WItem = preload("res://Scenes/Item.tscn")

var TScale = Vector2.ZERO
var Grab = true
var ToGrab = 0
var IdleTween
var PIn = false

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
			
	if(PIn == true && Input.is_action_just_pressed("interact") && get_parent().get_node("player").Hand == 0):
		get_parent().get_node("player").Hand = 1
		var I = WItem.instantiate()
		I.Held = true
		I.Spr = "res://icon.svg"
		I.ID = 1
		get_parent().add_child(I)
		Grab = false

func _on_collider_area_entered(area: Area2D) -> void:
	if(area.name == "PlayerArea"):
		PIn = true

func _on_collider_area_exited(area: Area2D) -> void:
	if(area.name == "PlayerArea"):
		PIn = false
