extends Node

var choice_scene
var setting_scene
var start_menu
var valid:bool
var config:ConfigFile=ConfigFile.new()

var random_all_number:int
var single_choice:int
var multiple_choice:int
var bool_choice:int


func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("space"):
		valid=!valid
		if valid:
			var setting_menu=preload("res://scenes/setting_menu/setting_menu.tscn").instantiate()
			setting_menu.name="setting_menu"
			add_child(setting_menu)
		elif not valid && is_instance_valid(get_node("setting_menu")):
			get_node("setting_menu").queue_free()


func config_save(data,type:String):
	if not config.has_section_key("设置","题干颜色"):
		config.set_value("设置","题干颜色",Color(1,1,1,1))
	if not config.has_section_key("设置","背景可见性"):
		config.set_value("设置","背景可见性",false)
	
	match type:
		"题干颜色":
			config.set_value("设置","题干颜色",data)
		"背景可见性":
			config.set_value("设置","背景可见性",data)
		"敬请期待":
			config.set_value("设置","题干颜色",data)
		pass

	config.save("res://data_saver.cfg")


func config_load():
	var result=config.load("res://data_saver.cfg")
	if result==OK:
		Global.choice_scene.get_node("Background").visible=config.get_value("设置","背景可见性")
		Global.choice_scene.get_node("QuestionStem").modulate=config.get_value("设置","题干颜色")


		
