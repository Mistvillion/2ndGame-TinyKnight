extends CharacterBody2D


const SPEED = 150.0  # 速度
const JUMP_VELOCITY = -300.0  # 跳跃速度

# 获取对AnimatedSprite2D的引用
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# 玩家没有站在平台上，就增加重力
	if not is_on_floor():
		velocity += get_gravity() * delta

	# 处理跳跃操作
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# 获取移动方向：定义了一个基于输入的方向变量，不按按钮则值为0，按左则为-1，按右则为1
	var direction := Input.get_axis("move_left", "move_right")  
	
	# 左右移动的时候翻转动画
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# 控制动画播放
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# 移动
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
