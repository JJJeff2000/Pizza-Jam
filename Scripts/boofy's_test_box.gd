extends Node2D

var test_fish: ItemData
var can_fish = false

func _ready() -> void:
	$AnimationPlayer.play("Fade_In")
	test_fish = Global.get_item("fish_test")
	
	if test_fish == null:
		push_error("Test item not found. Make sure the item id is 'test_fish' and it is loaded in Global.")
		return

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if can_fish:
			$AnimationPlayer.play("Fade_Out")
			$Scene_Change.start()
		else:
			pass

func _on_add_fish_pressed():
	Global.add_item(test_fish, 1)

func _on_remove_fish_pressed():
	Global.remove_item(test_fish, 1)

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		$Label.show()
	can_fish = true

func _on_area_2d_body_exited(body):
	if body.is_in_group("Player"):
		$Label.hide()
	can_fish = false

func _on_scene_change_timeout():
	get_tree().change_scene_to_file("res://Scenes/mini_game_tester.tscn")
