extends Control

@export var slot_scene: PackedScene
@onready var grid: GridContainer = $PanelContainer/MarginContainer/VBoxContainer/GridContainer

func _ready() -> void:
	Global.inventory_changed.connect(refresh)
	refresh()
	visible = false

func refresh() -> void:
	for child in grid.get_children():
		child.queue_free()
	
	if Global.inventory == null:
		return
	
	for slot: InventorySlot in Global.inventory.slots:
		var slot_ui = slot_scene.instantiate()
		grid.add_child(slot_ui)
		slot_ui.set_slot(slot)

func _process(_delta: float) -> void:
	$PanelContainer/MarginContainer/VBoxContainer/Money.text = ("$" + str(Global.money_counter))

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("inventory_toggle"):
		visible = not visible
