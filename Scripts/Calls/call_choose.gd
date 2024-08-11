extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	Globals.currentScreenSize = DisplayServer.window_get_size() # returns window screen
	size = Globals.currentScreenSize
	
	init_SelectButton()

func init_SelectButton():
	$Control/chooseBTN2.clear()
	var list_ = CallManage.callers
	for i in list_:
		#print(i["name"])
		$Control/chooseBTN2.add_item(i["name"])
	
	#$Control/chooseBTN2.text = "Call: "


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_choose_btn_pressed():
	randomize()
	var max_ = len(CallManage.callers)
	var callID = randi_range(0,max_)
	CallManage.show_()
	CallManage.callID(callID)
	self.hide()


func _on_choose_btn_2_item_selected(index):
	pass # Replace with function body.
	print(index, "is index")
	
	# check for first index
	if index==0:
		CallManage.show()
		CallManage.callID(0)
		return
	else:
		pass
	
	var tgt
	tgt = CallManage.callers.find(index)
	
	#tgt = $Control/chooseBTN2.get_item_index(index) ## get index
	tgt = $Control/chooseBTN2.get_item_text(index) ## get text!
	print(tgt, " is target name")
	
	CallManage.show()
	CallManage.callName(tgt)
	self.hide()
	#var ID
	#ID = CallManage.callers.find(tgt)
	#print(ID)
	#CallManage.callID
	
	match index:
		#"JohnPork":
			#pass
			#CallManage.show_()
			#CallManage.callID(0)
			#self.hide()
		#"FreakyDog":
			#pass
			#CallManage.show_()
			#CallManage.callID(3)
			##CallManage.callers.find(index)
			#self.hide()
		#"pDiddy":
			#CallManage.show_()
			#CallManage.callID(4)
			#self.hide()
			
		_: # DEFAULT
			pass


func _on_btn_file_pressed():
	pass # Replace with function body.
	$btn_File/FileDialog.show()


func _on_file_dialog_file_selected(path):
	pass # Replace with function body.
	var imgPath = path
	var imgNEW = Image.new()
	imgNEW.load(imgPath)
	
	var imgTextureNew = ImageTexture.new()
	imgTextureNew.set_image(imgNEW)
	
	$TextureRect.texture = imgTextureNew
