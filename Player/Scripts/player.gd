class_name Player
extends CharacterBody2D

@onready var playerstateMachine: StateMachine = $PlayerStateMachine
var lastDirection : String = 'Down'

func _ready():
	playerstateMachine.transitionRequested.connect(playerstateMachine.transitionTo)
