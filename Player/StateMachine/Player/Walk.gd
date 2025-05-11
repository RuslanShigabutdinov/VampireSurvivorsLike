class_name WalkState
extends State

var moveSpeed: float = 150.0
var accelerationSpeed : float = 15.0
var animationName : String

func enter():
	print("Entering Walk State")
	updateAnimation(Vector2.DOWN)

func physicsUpdate(delta: float):
	
	var direction : Vector2 = Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown")
	
	if direction == Vector2.ZERO:
		stateMachine.transitionRequested.emit("Idle")
	else:
		updateAnimation(direction)
		
	player.velocity.x = move_toward(player.velocity.x, moveSpeed * direction.x, accelerationSpeed)
	player.velocity.y = move_toward(player.velocity.y, moveSpeed * direction.y, accelerationSpeed)
	player.move_and_slide()	
		
func updateAnimation(direction: Vector2):
	var vertical : String = 'Down'
	var horizontal : String = ''
	
	if direction.x > 0:
		horizontal = 'Right'
	elif direction.x < 0:
		horizontal = 'Left'
		
	if direction.y < 0:
		vertical = 'Up'
	player.lastDirection = horizontal+vertical
	animationName = 'walk' + player.lastDirection
	animationPlayer.play(animationName)
