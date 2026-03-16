extends Node

signal inventory_changed

var player: CharacterBody2D
var inventory: Inventory
var items: Dictionary = {}

func _ready():
	inventory = Inventory.new(24)
	inventory.changed.connect(_on_inventory_changed)

func _on_inventory_changed():
	inventory_changed.emit()

func add_item(item: ItemData, amount: int = 1) -> bool:
	return inventory.add_item(item, amount)

func remove_item(item: ItemData, amount: int = 1) -> bool:
	return inventory.remove_item(item, amount)

func load_item(item: ItemData):
	items[item.id] = item

func get_item(id: String) -> ItemData:
	return items.get(id)
