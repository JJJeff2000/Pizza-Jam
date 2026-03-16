extends PanelContainer
class_name InventorySlotUI

@onready var icon: TextureRect = $MarginContainer/VBoxContainer/Icon
@onready var quantity_label: Label = $MarginContainer/VBoxContainer/Quantity

func set_slot(slot: InventorySlot) -> void:
	if slot == null or slot.is_empty():
		icon.texture = null
		quantity_label.text = ""
		return
	
	icon.texture = slot.item.icon
	
	if slot.quantity > 1:
		quantity_label.text = str(slot.quantity)
	else:
		quantity_label.text = ""
