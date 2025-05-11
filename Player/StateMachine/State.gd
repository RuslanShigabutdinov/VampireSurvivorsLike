class_name State extends Node

signal transitionRequested(stateName: String)

var stateMachine: StateMachine
var player: CharacterBody2D
var animationPlayer: AnimationPlayer

func enter():
	pass

func exit():
	pass

func update(_delta: float):
	pass

func physicsUpdate(_delta: float):
	pass

func handleInput(_event: InputEvent):
	pass
