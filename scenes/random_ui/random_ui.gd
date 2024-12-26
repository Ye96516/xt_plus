extends Control



func _on_all_number_text_submitted(new_text: String) -> void:
	Global.random_all_number=int(new_text)
	if Global.single_choice && Global.multiple_choice && Global.bool_choice:
		get_tree().change_scene_to_file("res://scenes/random_question/random_question.tscn")


func _on_single_choice_text_submitted(new_text: String) -> void:
	pass # Replace with function body.


func _on_multiple_choice_text_submitted(new_text: String) -> void:
	pass # Replace with function body.


func _on_bool_question_text_submitted(new_text: String) -> void:
	pass # Replace with function body.
