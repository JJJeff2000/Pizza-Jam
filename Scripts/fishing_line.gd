extends Line2D

func _physics_process(_delta):
	$".".points = [$"../Start_Point".global_position, $"../Hook".global_position]
