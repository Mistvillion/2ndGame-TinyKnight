extends Node2D

const SPEED = 60  # 速度

var direction = 1  # 运动方向，1是向右，-1是向左

# 获取对RayCastRight和RayCastLeft的引用
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft

# 获取对AnimatedSprite2D的引用
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite.flip_h = false
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite.flip_h = true
	
	position.x += direction * SPEED * delta
	
