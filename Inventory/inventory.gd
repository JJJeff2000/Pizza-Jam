extends Resource

class_name Inventory

signal change

@export var slots: Array[InventorySlot] = []
@export var max_slots: int = 20


func _init(slot_count: int = 20):
	max_slots = slot_count
	slots.clear()
	
	for i in slot_count:
		slots.append(InventorySlot.new())
	
func add_item(item: ItemData, amount: int = 1) -> bool:
	if item == null or amount <= 0:
		return false
	
	for slot: InventorySlot in slots:
		if slot.item == item and slot.quantity < item.max_stack:
			var space: int = item.max_stack - slot.quantity
			var to_add: int = mini(space, amount)
	
			slot.quantity += to_add
			amount -= to_add
	
			if amount <= 0:
				change.emit()
				return true
	
	for slot: InventorySlot in slots:
		if slot.is_empty():
			var to_add: int = mini(item.max_stack, amount)
	
			slot.item = item
			slot.quantity = to_add
			amount -= to_add
	
			if amount <= 0:
				change.emit()
				return true
	
	change.emit()
	return false

func remove_item(item: ItemData, amount: int = 1) -> bool:
	if item == null or amount <= 0:
		return false
	
	var remaining: int = amount

	for slot: InventorySlot in slots:
		if slot.item == item and slot.quantity > 0:
			var taken: int = mini(slot.quantity, remaining)
	
			slot.quantity -= taken
			remaining -= taken
	
			if slot.quantity <= 0:
				slot.clear()
	
			if remaining <= 0:
				change.emit()
				return true
	
	change.emit()
	return false

func count_item(item: ItemData) -> int:
	var total: int = 0
	
	for slot: InventorySlot in slots:
		if slot.item == item:
			total += slot.quantity
	
	return total

func has_item(item: ItemData, amount: int = 1) -> bool:
	return count_item(item) >= amount

func has_space_for(item: ItemData, amount: int = 1) -> bool:
	if item == null or amount <= 0:
		return false
	
	var remaining: int = amount
	
	for slot: InventorySlot in slots:
		if slot.item == item and slot.quantity < item.max_stack:
			remaining -= item.max_stack - slot.quantity
	
			if remaining <= 0:
				return true
	
	for slot: InventorySlot in slots:
		if slot.is_empty():
			remaining -= item.max_stack
	
			if remaining <= 0:
				return true
	
	return false
