extends RichTextLabel

func _ready() -> void:
	await owner.ready
	match_answer()


func match_answer():
	#a
	if owner.a==true && owner.b==false && owner.c==false && owner.d==false:
		self.text="正确答案为："\
		+"A. "+owner.one.get_node("OptionOne").text
	#b
	if owner.b==true && owner.a==false && owner.c==false && owner.d==false:
		self.text="正确答案为："\
		+"B. "+owner.two.get_node("OptionTwo").text
	#c
	if owner.c==true && owner.b==false && owner.a==false && owner.d==false:
		self.text="正确答案为："\
		+"C. "+owner.three.get_node("OptionThree").text
	#d
	if owner.d==true && owner.b==false && owner.c==false && owner.a==false:
		self.text="正确答案为："\
		+"D. "+owner.four.get_node("OptionFour").text
	#ab
	if owner.a==true && owner.b==true && owner.c==false && owner.d==false:
		self.text="正确答案为："\
		+"A."+owner.one.get_node("OptionOne").text+"  "\
		+"B."+owner.two.get_node("OptionTwo").text
	#ac
	if owner.a==true && owner.b==false && owner.c==true && owner.d==false:
		self.text="正确答案为："\
		+"A."+owner.one.get_node("OptionOne").text+"  "\
		+"C."+owner.three.get_node("OptionThree").text
	#ad
	if owner.a==true && owner.b==false && owner.c==false && owner.d==true:
		self.text="正确答案为："\
		+"A."+owner.one.get_node("OptionOne").text+"  "\
		+"D."+owner.four.get_node("OptionFour").text
	#bc
	if owner.a==false && owner.b==true && owner.c==true && owner.d==false:
		self.text="正确答案为："\
		+"B."+owner.two.get_node("OptionTwo").text+"  "\
		+"C."+owner.three.get_node("OptionThree").text
	#bd
	if owner.a==false && owner.b==true && owner.c==false && owner.d==true:
		self.text="正确答案为："\
		+"B."+owner.two.get_node("OptionTwo").text+"  "\
		+"D."+owner.four.get_node("OptionFour").text
	#cd
	if owner.a==false && owner.b==false && owner.c==true && owner.d==true:
		self.text="正确答案为："\
		+"C."+owner.three.get_node("OptionThree").text+"  "\
		+"D."+owner.four.get_node("OptionFour").text
	#abc
	if owner.a==true && owner.b==true && owner.c==true && owner.d==false:
		self.text="正确答案为："\
		+"A."+owner.one.get_node("OptionOne").text+"  "\
		+"B."+owner.two.get_node("OptionTwo").text+"  "\
		+"C."+owner.three.get_node("OptionThree").text
	#acd
	if owner.a==true && owner.b==false && owner.c==true && owner.d==true:
		self.text="正确答案为："\
		+"A."+owner.one.get_node("OptionOne").text+"  "\
		+"C."+owner.three.get_node("OptionThree").text+"  "\
		+"D."+owner.four.get_node("OptionFour").text
	#abd
	if owner.a==true && owner.b==true && owner.c==false && owner.d==true:
		self.text="正确答案为："\
		+"A."+owner.one.get_node("OptionOne").text+"  "\
		+"B."+owner.two.get_node("OptionTwo").text+"  "\
		+"D."+owner.four.get_node("OptionFour").text
	#abcd
	if owner.a==false && owner.b==true && owner.c==true && owner.d==true:
		self.text="正确答案为："\
		+"B."+owner.two.get_node("OptionTwo").text+"  "\
		+"C."+owner.three.get_node("OptionThree").text+"  "\
		+"D."+owner.four.get_node("OptionFour").text
	#abcd
	if owner.a==true && owner.b==true && owner.c==true && owner.d==true:
		self.text="正确答案为："\
		+"A."+owner.one.get_node("OptionOne").text+"  "\
		+"B."+owner.two.get_node("OptionTwo").text+"  "\
		+"C."+owner.three.get_node("OptionThree").text+"  "\
		+"D."+owner.four.get_node("OptionFour").text
