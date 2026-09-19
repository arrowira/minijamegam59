extends Control




func _on_new_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
	pass # Replace with function body.


	
func _on_rules_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/explains.tscn")
	pass # Replace with function body.



func _on_options_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/options.tscn")
	pass # Replace with function body.



func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
	
	
