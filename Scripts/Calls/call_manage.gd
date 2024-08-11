extends Control

var declineCount : int = 0
var currentScreenSize : Vector2
var waitTime : int = 10

@onready var animP =  $AnimationPlayer
@onready var username = $pnl_top/lbl_name
@onready var pfp = $pfp

var dfltAudio = "res://Assets/Audio/Voices/what is simon waffling about.mp3"

var johnPork : Dictionary = {
	"name" : "John Pork", "pfp" : "res://Assets/Textures/JohnPork_01.jpeg",
	"ring" : "default", "msg" : "letme",
	"vid" : "res://Assets/Videos/John pork.ogv"
	 }
var freakBob : Dictionary = {
	"name" : "Freaky Bob", "pfp" : "res://Assets/Textures/freakbob_pfp.PNG",
	"ring" : "res://Assets/Audio/Ringtones/Pick up the phone baby.mp3", "msg" : "letme",
	"audio" : "res://Assets/Audio/Voices/freakbob_heyManItsFreakbob.ogg"
	 }
var freakPlankton : Dictionary = {
	"name" : "Freaky Plankton", "pfp" : "res://Assets/Textures/pfp_planktonFreaky.png",
	"ring" : "res://Assets/Audio/Ringtones/Pick up the phone baby.mp3", "msg" : "letme",
	"audio" : dfltAudio
	 }
var freakDog : Dictionary = {
	"name" : "Freaky Dog", "pfp" : "res://Assets/Textures/pfp_freakyDog.PNG",
	"ring" : "res://Assets/Audio/Ringtones/Classic Telephone Ringtone _ Ringtone for Android _ Old Phone Ringtones.mp3", "msg" : "letme",
	"vid" : "res://Assets/Videos/come over here and kiss me on my hot mouth im feeling romantical.ogv"
	 }
var pDiddy : Dictionary = {
	"name" : "Meat master", "pfp" : "res://Assets/Textures/pfp_pDiddy02.jpeg",
	"ring" : "res://Assets/Audio/Ringtones/Pick up the phone baby.mp3", "msg" : "letme",
	"audio" : "res://Assets/Audio/Voices/I PARTY HARDY SHUN WORD IS BOND SHUN.mp3"
	 }

var callers : Array = [johnPork, freakBob,freakPlankton, freakDog,pDiddy]
var nextCaller_ind = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	currentScreenSize = DisplayServer.window_get_size() # returns window screen
	size = currentScreenSize
	$muteTimer.wait_time = waitTime


func _input(event):
	if Input.is_action_just_pressed("ui_up"):
		#call_(johnPork) # hard code john pork
		callNext()
		

func show_():
	animP.play("fadeIn",-1,1.0,false)
	top_level = true
	#DisplayServer
func hide_():
	animP.play("fadeOut")
	hide()
	top_level = false
	#hide()

func callNext():
	
	if nextCaller_ind < len(callers):
		call_(callers[nextCaller_ind])
		nextCaller_ind += 1
	else:
		nextCaller_ind = 0
		call_(callers[nextCaller_ind])
		nextCaller_ind += 1

func callID(ID_):
	pass
	call_(callers[ID_-1])

func callName(name_):
	pass
	for i in callers: # get list of contacts
		if i["name"]==name_: # make sure that current cointact has the given username
			print(i)
			call_(i)
	show_()

func _process(delta):
	pass
	# might need to enable bottom line for mobile
	#currentScreenSize = DisplayServer.screen_get_size() # returns my device screen instead of window
	currentScreenSize = DisplayServer.window_get_size() # returns window screen
	#print(currentScreenSize)
	size = currentScreenSize

func call_(user_:Dictionary={}):
	username.text = str( user_["name"] ) # load username
	var newTexture = load(user_["pfp"]) # create new texture, with key value
	pfp.texture = newTexture  # load the new texture
	
	var newRTone# = load(user_["ring"])
	if user_["ring"]=="default":
		newRTone = load("res://Assets/Audio/Ringtones/John Pork Calling Sound Effect _ Soundboard Link 🔽🔽.mp3")
	else:
		newRTone = load(user_["ring"])
	$sfx_ringtone.stream = newRTone
	$sfx_ringtone.play()
	
	# globals stuff
	Globals.currentUser = username.text
	Globals.dictUser = user_
	
	$muteTimer.start()

func answer_(user):
	pass

func decline_():
	pass


func _on_btn_accept_pressed():
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Scenes/Calls/call_answer.tscn")
	
	hide_()
	#self.hide()
	#self.top_level = false
	print("should be hidden from call_")


func _on_mute_timer_timeout():
	pass # Replace with function body.
	$sfx_ringtone.stop()
