extends Node

var score = 0  # 得分
@onready var label_score: Label = $Label_score

# 增加分数并打印
func add_point():
	score += 1
	label_score.text = "You made it! Congradulations!
There are 30 coins in this map.
You have already collected " + str(score) + " coins!"
