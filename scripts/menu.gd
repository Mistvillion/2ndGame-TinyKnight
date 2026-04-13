extends Control

# 指向关卡场景文件路径
@export var game_scene_path : String = "res://scenes/game.tscn"

func _ready():
	# 连接按钮的按下信号
	$VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	# 跳转到关卡场景
	get_tree().change_scene_to_file(game_scene_path)

func _on_quit_pressed():
	# 退出游戏
	get_tree().quit()
