# TinyKnight

一个使用 Godot 4.6 制作的 2D 平台跳跃小游戏项目。玩家在关卡中控制骑士跳跃、移动、收集金币，同时避开史莱姆敌人和掉落死亡区域。

## 项目概览

- 引擎版本：Godot 4.6
- 主入口场景：`res://scenes/menu.tscn`
- 主游戏场景：`res://scenes/game.tscn`
- 项目类型：2D Platformer
- 目标玩法：收集关卡中的 30 枚金币并完成探索

## 当前功能

- 主菜单界面，支持开始游戏和退出游戏
- 玩家左右移动、跳跃
- 金币收集与分数统计
- 巡逻敌人（Slime）
- 死亡区域检测与场景重载
- 移动平台
- 背景音乐与基础音效资源

## 操作方式

- `A` / `Left Arrow`：向左移动
- `D` / `Right Arrow`：向右移动
- `Space`：跳跃

## 运行项目

### 方式一：通过 Godot 编辑器运行

1. 使用 Godot 4.6 打开项目根目录。
2. 等待资源导入完成。
3. 运行项目，默认会进入菜单场景 `scenes/menu.tscn`。

### 方式二：导出 Windows 可执行文件

项目已包含 Windows Desktop 导出预设，可在 Godot 编辑器中直接导出。

默认导出预设信息：

- 平台：Windows Desktop
- 架构：`x86_64`
- 预设文件：`export_presets.cfg`

## 项目结构

```text
Platformer-bundle/
|- assets/                 美术、字体、音乐、音效资源
|  |- fonts/
|  |- music/
|  |- sounds/
|- scenes/                 场景与部分场景脚本
|  |- menu.tscn            主菜单
|  |- game.tscn            主关卡
|  |- player.tscn          玩家场景
|  |- coin.tscn            金币场景
|  |- slime.tscn           敌人场景
|  |- killzone.tscn        死亡区域
|- scripts/                复用脚本
|  |- player.gd            玩家移动与跳跃逻辑
|  |- coin.gd              金币拾取逻辑
|  |- game_manager.gd      分数与界面管理
|  |- menu.gd              菜单逻辑
|  |- slime.gd             敌人巡逻逻辑
|  |- killzone.gd          死亡与重生逻辑
|- project.godot           Godot 项目配置
|- export_presets.cfg      导出配置
```

## 核心脚本说明

### `scripts/player.gd`

负责玩家角色的核心行为：

- 读取左右移动输入
- 处理跳跃
- 应用重力
- 切换待机、奔跑、跳跃动画
- 根据方向翻转角色朝向

### `scripts/coin.gd`

负责金币拾取：

- 检测玩家进入金币区域
- 通知 `GameManager` 增加分数
- 播放拾取动画

### `scripts/killzone.gd`

负责角色死亡处理：

- 检测角色掉入死亡区域
- 降低时间流速制造失败反馈
- 移除玩家碰撞体
- 定时重新加载当前场景

### `scenes/game_manager.gd`

负责关卡内的文本与分数展示：

- 记录当前金币数量
- 更新关卡提示文本

### `scenes/slime.gd`

负责敌人巡逻行为：

- 使用左右 `RayCast2D` 检测边界
- 到达边缘后改变移动方向
- 同步翻转敌人朝向

## 场景设计说明

当前主关卡 `scenes/game.tscn` 中包含以下元素：

- TileMap 地图地形
- 玩家与跟随摄像机
- 30 枚金币
- 多个移动平台
- 多个史莱姆敌人
- 提示文本
- 底部死亡区域

## 资源说明

- 精灵资源位于 `assets/sprites/`
- 音效资源位于 `assets/sounds/`
- 背景音乐位于 `assets/music/`
- 字体资源位于 `assets/fonts/`
