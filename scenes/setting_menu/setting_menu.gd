extends Control

@onready var color_picker: ColorPicker = $CanvasLayer/AffectMain/ColorPicker
@onready var line_edit: LineEdit = $CanvasLayer/LineEdit

func _ready() -> void:
	color_picker.visible=false
	
#通过输入转换题目
func _on_line_edit_text_submitted(new_text: String) -> void:
	if int(new_text)>=1 && int(new_text)<=900:
		Global.choice_scene.current_order=int(new_text)
		Global.choice_scene.init_dat()

#按钮确定转换题目
func _on_questions_pressed() -> void:
	if int(line_edit.text)>=1 && int(line_edit.text)<=900:
		Global.choice_scene.current_order=int(line_edit.text)
		Global.choice_scene.init_dat()

#点击空白处销毁场景
func _on_control_gui_input(event: InputEvent) -> void:
	if event is InputEventMouse:
		if event.button_mask==MOUSE_BUTTON_LEFT and event.is_pressed():
			self.queue_free()

#颜色选取器的可见性
func _on_stem_button_pressed() -> void:
	color_picker.visible=!color_picker.visible
	
#背景可见性
func _on_background_visiable_pressed() -> void:
	Global.choice_scene.get_node("Background").visible=!Global.choice_scene.get_node("Background").visible
	Global.config_save(Global.choice_scene.get_node("Background").visible,"背景可见性")

#改变题干颜色
func _on_color_picker_color_changed(color: Color) -> void:
	Global.choice_scene.get_node("QuestionStem").modulate=color
	Global.config_save(color,"题干颜色")

#复原题干颜色
func _on_rest_stem_cl_pressed() -> void:
	Global.choice_scene.get_node("QuestionStem").modulate=Color(1,1,1,1)
	Global.config_save(Color(1,1,1,1),"题干颜色")
