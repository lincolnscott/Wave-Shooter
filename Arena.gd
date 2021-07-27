extends Node2D

var enemy_1 = preload("res://Enemy.tscn")

func _ready():
	Global.node_creation_parent = self

func _exit_tree():
	Global.node_creation_parent = null

func _on_Enemy_spawn_timer_timeout():
	var enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	while enemy_position.x < 640 and enemy_position.x > -80 and enemy_position.y < 360 and enemy_position.y > 45:
		enemy_position = Vector2(rand_range(-160, 670), rand_range(-90, 390))
	
	Global.instance_node(enemy_1, enemy_position, self)
	$Enemy_spawn_timer.wait_time *= 0.95

func _on_Difficulty_timeout():
	if $Enemy_spawn_timer.wait_time > 0.6:
		$Enemy_spawn_timer.wait_time -= 0.1
