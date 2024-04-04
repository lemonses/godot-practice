extends CharacterBody2D

var can_laser:bool = true
var can_grenade:bool = true
signal laser(pos)
signal grenade(pos,direction)

func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	var player_direction = (get_global_mouse_position() - position).normalized()
	velocity = direction * 500
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_laser:
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()].global_position
		can_laser = false
		$LaserTimer.start()
		laser.emit(selected_laser,player_direction)
	
	if Input.is_action_pressed("secondary action") and can_grenade:#
		var pos = $LaserStartPositions.get_children()[0].global_position
		can_grenade = false
		$GrenadeTimer.start()
		grenade.emit(pos,player_direction)
 
func _on_grenade_timer_timeout():
	can_grenade = true

func _on_laser_timer_timeout():
	can_laser = true
