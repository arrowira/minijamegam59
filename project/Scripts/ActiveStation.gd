extends Node2D

var inPlayer = false
var active = false

var isHoldingInput = false
var inputID = 1
var outputID = 2

var player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !active:
		$progress.visible=false
		$progress.value = 0
	else:
		$progress.visible=true
		$progress.value = 1-$progressTimer.time_left/$progressTimer.wait_time
	if inPlayer and Input.is_action_just_pressed("interact"):
		print(player.Hand)
		if player.Hand == inputID:
			if !isHoldingInput:
				player.Hand = 0
				isHoldingInput = true
		elif player.Hand == 0 and isHoldingInput == true:
			$progressTimer.start()
			active = true
	if inPlayer and Input.is_action_just_released("interact"):
		if isHoldingInput == true:
			active = false
			$progressTimer.stop()
			

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "PlayerArea":
		inPlayer = true
		player = area.get_parent()


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "PlayerArea":
		inPlayer = false


func _on_progress_timer_timeout() -> void:
	#completed action
	active = false
	isHoldingInput = false
	
	#give player item
	player.Hand = outputID
