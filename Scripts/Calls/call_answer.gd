extends Control


var time_ : int = 0
var mins : int
var secs : int

@onready var caller_ = $pnl_top/lbl_name
@onready var pfp_ = $pnl_top/pnl_icon/icon
@onready var callTime_ = $pnl_top/lbl_time

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	init_()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func init_():
	pass
	caller_.text = Globals.currentUser
	if Globals.dictUser.has("pfp"):
		var newTexture = load(Globals.dictUser["pfp"]) # create new texture, with key value
		pfp_.texture = newTexture  # load the new texture
	if Globals.dictUser.has("vid"):
		loadVid(Globals.dictUser["vid"])
	if Globals.dictUser.has("audio"):
		loadAudio(Globals.dictUser["audio"])

func loadVid(path_):
	print(path_)
	pass
	var newVid = load(path_)
	$vid.stream = newVid
	print("shoud've loaded vid")
	$vid.play()
func loadAudio(path_):
	pass
	var newAudio = load(path_)
	$voice.stream = newAudio
	$voice.play()


func endCall_():
	$pnl_top/lbl_time/callTIme.stop()
	$vid.stop()
	$voice.stop()
	$lblStatus.show()

func _on_call_t_ime_timeout():
	secs +=1
	if secs>=60:
		mins +=1
		secs = 0
	var res : String
	res = str(mins).pad_zeros(2) + ":" + str(secs).pad_zeros(2)
	callTime_.text = res


func _on_btn_decline_pressed():
	pass # Replace with function body.
	endCall_()
	await get_tree().create_timer(1.0).timeout
	get_tree().quit()


func _on_vid_finished():
	pass # Replace with function body.
	endCall_()
	
func _on_voice_finished():
	pass # Replace with function body.
	endCall_()
