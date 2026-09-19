extends Node2D

var Spr = "res://icon.svg"
var ID = 1
var Held = false
var PIn = false
var TDel = 0

func _ready():
	$Sprite.texture = load(Spr)

func _physics_process(delta: float) -> void:
	if(Held == false && PIn == true && Input.is_action_just_pressed("interact") && get_parent().get_node("player").Hand == 0):
		Held = true
	if(Held == true):
		global_position = get_parent().get_node("player").global_position
		if(Input.is_action_just_pressed("drop")):
			Held=false
	if(Held == true && get_parent().get_node("player").Hand == 0):
		TDel +=1
	else:
		TDel = 0
	if(TDel >= 3):
		queue_free()


func _on_item_collider_area_entered(area: Area2D) -> void:
	if(area.name == "PlayerArea"):
		PIn = true

func _on_item_collider_area_exited(area: Area2D) -> void:
	if(area.name == "PlayerArea"):
		PIn = false
