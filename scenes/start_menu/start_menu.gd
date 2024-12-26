extends Control

@onready var line_edit: LineEdit = %LineEdit
var random_arry:Array

func _ready() -> void:
	Global.start_menu=self

func _on_start_practice_pressed() -> void:
	get_tree().call_deferred("change_scene_to_file","res://scenes/choice_question/choice_question.tscn")

func _on_random_test_pressed() -> void:
	#初始化
	randomize()
	random_arry.clear()
	#添加进数组
	if int(line_edit.text)>0 && int(line_edit.text)<901:
		while random_arry.size()<int(line_edit.text):
			var test_number=randi_range(1,900)
			if not random_arry.has(test_number):
				random_arry.append(test_number)
			else:
				continue
	else:
		return
	print(random_arry)

	get_tree().change_scene_to_file("res://scenes/choice_question/choice_question.tscn")

	print(Global.choice_scene)
	Global.choice_scene.current_order=random_arry[0]
	Global.choice_scene.init_dat()
	pass
