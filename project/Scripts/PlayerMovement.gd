extends CharacterBody2D


@export var speed = 300.0
@export var dashSpeed = 1500.0

var dashing = false
var dashingCD = false
var direction

var Hand = 0 #0 = hand empty


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("dash") and !dashingCD:
		print("dash")
		print(Hand)
		$DashTimer.start()
		dashing = true
	if dashing:
		if direction == Vector2.ZERO:
			velocity = Vector2.RIGHT*dashSpeed
		else:
			velocity = direction*dashSpeed
	else:
		direction = Vector2(Input.get_axis("left", "right"),Input.get_axis("up", "down")).normalized()
		velocity = direction*speed
		
	if(Input.is_action_just_pressed("drop") && Hand!=0):
		Hand = 0

	move_and_slide()



func _on_dash_cd_timeout() -> void:
	dashingCD = false


func _on_dash_timer_timeout() -> void:
	$DashCD.start()
	dashing = false
	dashingCD = true
