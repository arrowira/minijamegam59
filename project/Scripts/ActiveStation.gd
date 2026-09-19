extends Node2D

var inPlayer = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$progress.value = $progressTimer.time_left/$progressTimer.wait_time
	if inPlayer and Input.is_action_just_pressed("interact"):
		$progressTimer.start()
	if inPlayer and Input.is_action_just_released("interact"):
		$progressTimer.reset()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "PlayerArea":
		inPlayer = true


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "PlayerArea":
		inPlayer = false
