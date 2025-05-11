class_name IdleState
extends State

func enter():
	print("Entering Idle State")
	var animationName : String= 'idle'+player.lastDirection
	print(animationName)
	animationPlayer.play(animationName)

func physicsUpdate(delta):
	var direction = Input.get_vector("walkLeft", "walkRight", "walkUp", "walkDown")
	if direction != Vector2.ZERO:
		stateMachine.transitionRequested.emit("Walk")
