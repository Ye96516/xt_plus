extends Control

@onready var one: Control = $One
@onready var two: Control = $Two
@onready var three: Control = $Three
@onready var four: Control = $Four
@onready var question_stem: = %QuestionStem
@onready var correct_answer: RichTextLabel = %CorrectAnswer

@export var current_order:int=0
@export var stem:String=""
@export var type:String=""
@export var a_content:String=""
@export var b_content:String=""
@export var c_content:String=""
@export var d_content:String=""
@export var a:bool
@export var b:bool
@export var c:bool
@export var d:bool
@export var different:String=""

var json_file_path:String="res://data/sheet.json"
var dat:Dictionary
var is_dragging:bool

var bool_arry:Array
var bool_temp:Dictionary
var current_bool:Dictionary

var choice_arry:Array
var choice_temp:Dictionary
var current_choice:Dictionary

var mulitple_arry:Array
var mulitple_temp:Dictionary
var current_mulitple:Dictionary

var random_all_arry:Array

func _ready() -> void:
	Global.choice_scene=self
	Global.config_load()
	#给dat赋初值
	dat=load_json_file(json_file_path)
	for i in dat.data:
		match i.题型:
			"判断题":
				bool_arry.append(i)
			"单选题":
				choice_arry.append(i)
			"多选题":
				mulitple_arry.append(i)
	while Global.bool_choice>0:
		bool_temp=bool_arry.pick_random()
		if current_bool==bool_temp:
			continue
			random_all_arry.append(bool_temp)
			current_bool=bool_temp
			Global.bool_choice-=1
	while Global.single_choice>0:
		bool_temp=bool_arry.pick_random()
		if current_bool==bool_temp:
			continue
			random_all_arry.append(bool_temp)
			current_bool=bool_temp
			Global.single_choice-=1
	while Global.multiple_choice>0:
		bool_temp=bool_arry.pick_random()
		if current_bool==bool_temp:
			continue
			random_all_arry.append(bool_temp)
			current_bool=bool_temp
			Global.multiple_choice-=1
	
	#获得题号
	current_order=dat.data[0].序号 if not load_game() else load_game()
	#获得题型
	type=dat.data[current_order-1].题型
	#获得题干
	stem=dat.data[current_order-1].题干
	#获得答案
	match dat.data[current_order-1].答案:
		"A":
			a=true
		"B":
			b=true
		"C":
			c=true
		"D":
			d=true
		"AB":
			a=true
			b=true
		"AC":
			a=true
			c=true
		"AD":
			a=true
			d=true
		"BC":
			b=true
			c=true
		"BD":
			b=true
			d=true
		"CD":
			c=true
			d=true
		"ACD":
			a=true
			c=true
			d=true
		"ABC":
			a=true
			b=true
			c=true
		"BCD":
			b=true
			c=true
			d=true
		"ABCD":
			a=true
			b=true
			c=true
			d=true
		"ABCD":
			a=true
			b=true
			c=true
			d=true
	
	correct_answer.visible=false
	#显示题干与选项

	question_stem.text=str(current_order)+"."+"[color=70ffc1]{%s}[/color]"%[type]+"  "+"[color=%s]%s[/color]"%["white",stem]
	if dat.data[current_order-1].has("选项A"):
		a_content=str(dat.data[current_order-1].选项A)
	else : a_content=""
	if dat.data[current_order-1].has("选项B"):
		b_content=str(dat.data[current_order-1].选项B)
	else : b_content=""
	if dat.data[current_order-1].has("选项C"):
		c_content=str(dat.data[current_order-1].选项C)
	else : c_content=""
	if dat.data[current_order-1].has("选项D"):
		d_content=str(dat.data[current_order-1].选项D)
	else : d_content=""
	one.get_node("OptionOne").text=a_content
	two.get_node("OptionTwo").text=b_content
	three.get_node("OptionThree").text=c_content
	four.get_node("OptionFour").text=d_content

func load_json_file(path:String):
	if FileAccess.file_exists(path):
		var read_file=FileAccess.open(path,FileAccess.READ)
		var paresd_file=JSON.parse_string(read_file.get_as_text())
		if paresd_file is Dictionary:
			return paresd_file
		else:
			printerr("出现错误，该数据不为字典")
	else:
		printerr("文件路径错误")

#以下四个信号为选项
func _on_option_one_pressed() -> void:
	if a:
		one.modulate=Color.AQUAMARINE
	else:
		one.modulate=Color.BROWN
	correct_answer.visible=true

func _on_option_two_pressed() -> void:
	if b:
		two.modulate=Color.AQUAMARINE
	else:
		two.modulate=Color.BROWN
	correct_answer.visible=true
		

func _on_option_three_pressed() -> void:
	if c:
		three.modulate=Color.AQUAMARINE
	else:
		three.modulate=Color.BROWN
	correct_answer.visible=true
		
func _on_option_four_pressed() -> void:
	if d:
		four.modulate=Color.AQUAMARINE
	else:
		four.modulate=Color.BROWN
	correct_answer.visible=true

#以下两个信号是转换题目信号
func _on_next_question_pressed() -> void:
	if current_order==900:
		return
	current_order+=1
	init_dat()


func _on_last_question_pressed() -> void:
	if current_order==1:
		return
	current_order-=1
	init_dat()

#此方法初始化题目
func init_dat():
	#存储当前题号
	save()
	#选项初始化
	a=false
	b=false
	c=false
	d=false
	#颜色初始化
	one.modulate=Color(1, 1, 1, 1)
	two.modulate=Color(1, 1, 1, 1)
	three.modulate=Color(1, 1, 1, 1)
	four.modulate=Color(1, 1, 1, 1)
	#题型初始化
	type=dat.data[current_order-1].题型
	#题干初始化
	stem=dat.data[current_order-1].题干
	question_stem.text=str(current_order)+"."+"[color=70ffc1]{%s}[/color]"%[type]+"  "+"[color=%s]%s[/color]"%["white",stem]
	#选项内容初始化
	if dat.data[current_order-1].has("选项A"):
		a_content=str(dat.data[current_order-1].选项A)
	else : a_content=""
	if dat.data[current_order-1].has("选项B"):
		b_content=str(dat.data[current_order-1].选项B)
	else : b_content=""
	if dat.data[current_order-1].has("选项C"):
		c_content=str(dat.data[current_order-1].选项C)
	else : c_content=""
	if dat.data[current_order-1].has("选项D"):
		d_content=str(dat.data[current_order-1].选项D)
	else : d_content=""
	one.get_node("OptionOne").text=a_content
	two.get_node("OptionTwo").text=b_content
	three.get_node("OptionThree").text=c_content
	four.get_node("OptionFour").text=d_content
	#答案初始化
	match dat.data[current_order-1].答案:
		"A":
			a=true
		"B":
			b=true
		"C":
			c=true
		"D":
			d=true
		"AB":
			a=true
			b=true
		"AC":
			a=true
			c=true
		"AD":
			a=true
			d=true
		"BC":
			b=true
			c=true
		"BD":
			b=true
			d=true
		"CD":
			c=true
			d=true
		"ABC":
			a=true
			b=true
			c=true
		"ABD":
			a=true
			b=true
			d=true
		"ACD":
			a=true
			c=true
			d=true
		"BCD":
			b=true
			c=true
			d=true
		"ABCD":
			a=true
			b=true
			c=true
			d=true
	#答案内容初始化
	correct_answer.match_answer()
	correct_answer.visible=false

#右上角隐藏的按钮
func _on_hide_answer_pressed() -> void:
	correct_answer.visible=false

#实例化设置场景
var valid:bool=true
func _on_appear_setting_pressed() -> void:
	valid=!valid
	if valid:
		var setting_menu=preload("res://scenes/setting_menu/setting_menu.tscn").instantiate()
		setting_menu.name="setting_menu"
		add_child(setting_menu)
	elif not valid && is_instance_valid(get_node("setting_menu")):
		get_node("setting_menu").queue_free()

#以下两个方法为存储题号
func save()	:
	var file=FileAccess.open("res://game_saver",FileAccess.WRITE)
	file.store_var(current_order)
 
func load_game():
	var file=FileAccess.open("res://game_saver",FileAccess.READ)
	if file:
		current_order=file.get_var(current_order)
		return current_order
	else:
		return
