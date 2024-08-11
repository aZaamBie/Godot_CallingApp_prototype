extends Control

var taps_ : int = 0
@onready var btn_ = $btnTexture

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func updateCounterText(args):
	pass
	$tapCounter.text = "Taps: " + str(args)

func _on_btn_texture_pressed():
	pass # Replace with function body.
	btn_.flip_h = !btn_.flip_h
	if $tapFX.emitting == true:
		$tapFX.emitting = false
	$tapFX.emitting = true
	
	taps_ += 1
	updateCounterText(taps_)

func _on_btn_reset_pressed():
	pass # Replace with function body.
	taps_ = 0
	updateCounterText(taps_)


func _on_btn_back_pressed():
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Scenes/Calls/call_choose.tscn")
