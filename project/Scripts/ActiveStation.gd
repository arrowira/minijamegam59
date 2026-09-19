extends Node2D

var inPlayer = false
var active = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !active:
		$progress.value = 0
	else:
		$progress.value = 1-$progressTimer.time_left/$progressTimer.wait_time
	if inPlayer and Input.is_action_just_pressed("interact"):
		$progressTimer.start()
		active = true
	if inPlayer and Input.is_action_just_released("interact"):
		active = false
		$progressTimer.stop()
		

func _on_area_2d_area_entered(area: Area2D) -> void:
	print(area.name)
	if area.name == "PlayerArea":
		inPlayer = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "PlayerArea":
		inPlayer = false
