extends CharacterBody2D

@export var speed = 900

func get_input():
	var input_direction = Input.get_axis("Left", "Right")
	velocity.x = input_direction * speed
	
func rotate_player():
	var rotation = Input.get_axis("Rotate-left", "Rotate-right")
	if(rotation > 0):
		self.rotation += .1
		
	if(rotation < 0):
		self.rotation -= .1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	get_input()
	rotate_player()
	move_and_slide()
