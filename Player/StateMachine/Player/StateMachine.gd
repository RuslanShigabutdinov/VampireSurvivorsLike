class_name StateMachine extends Node

@export var initialState: State
var currentState: State
var states: Dictionary = {}

signal transitionRequested(stateName: String)

func _ready():
	for child in get_children():
		if child is State:
			states[child.name] = child
			child.stateMachine = self
			child.player = get_parent() as CharacterBody2D
			child.animationPlayer = child.player.get_node("AnimationPlayer")
	print("Registered states: ", states.keys())
	if initialState:
		initialState.enter()
		currentState = initialState

func _process(delta):
	if currentState:
		currentState.update(delta)

func _physics_process(delta):
	if currentState:
		currentState.physicsUpdate(delta)

func _unhandled_input(event):
	if currentState:
		currentState.handleInput(event)

func transitionTo(stateName: String):
	if not states.has(stateName):
		printerr("State %s not found!" % stateName)
		return
	currentState.exit()
	currentState = states[stateName]
	currentState.enter()
