extends Node

var score = 0  # 得分

# 增加分数并打印
func add_point():
	score += 10
	print("Current score: " + str(score))
