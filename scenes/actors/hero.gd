extends Actor
class_name Hero

func move(dir: Vector2) -> Vector2:
	super.move(dir)
	animated_sprite_2d.play("jump")
	return position
	
	
func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "jump":
		animated_sprite_2d.play("default")
