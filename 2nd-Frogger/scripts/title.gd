extends Control

func _ready() -> void:
	$Score.text = "Score: " + str(Global.score)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("space"):
		get_tree().change_scene_to_file("res://scenes/main_scene.tscn")
