extends Resource

class_name InventorySlot

@export var item: ItemData
@export var quantity: int = 0

func is_empty() -> bool:
	return item == null or quantity <= 0

func clear():
	item = null
	quantity = 0
