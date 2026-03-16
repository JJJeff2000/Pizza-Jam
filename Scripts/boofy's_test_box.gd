extends Node2D

var test_fish: ItemData

func _ready() -> void:
	test_fish = Global.get_item("fish_test")
	
	if test_fish == null:
		push_error("Test item not found. Make sure the item id is 'test_fish' and it is loaded in Global.")
		return
	

func _on_add_fish_pressed():
	Global.add_item(test_fish, 1)

func _on_remove_fish_pressed():
	Global.remove_item(test_fish, 1)
