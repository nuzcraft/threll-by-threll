extends Node2D
class_name Actor

@export var direction: Vector2 = Vector2.DOWN

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite_2d.play("default")
	rotate_sprite(direction)

func move(dir: Vector2) -> Vector2:
	position += dir * Vector2(16, 16)
	animated_sprite_2d.position -= dir * Vector2(16, 16)
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(animated_sprite_2d, "position", Vector2.ZERO, 0.2)
	return position 
	
func die() -> void:
	animated_sprite_2d.self_modulate = Color.WHITE
	rotate_sprite(Vector2.DOWN)
	animated_sprite_2d.play("dead")
	
func rotate_sprite(dir: Vector2) -> void:
	match dir:
		Vector2.DOWN:
			animated_sprite_2d.rotation_degrees = 0
		Vector2.LEFT:
			animated_sprite_2d.rotation_degrees = 90
		Vector2.UP:
			animated_sprite_2d.rotation_degrees = 180
		Vector2.RIGHT:
			animated_sprite_2d.rotation_degrees = 270
