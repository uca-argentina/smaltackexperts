Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testAPlayerRollDicesAndMoveForwards [
	| dice1 dice2 player dices type |
	type := DeterministicDice new.
	dice1 := Dice with: 6 facesAndType: type.
	dice2 := Dice with: 8 facesAndType: type.
	player := Player withName: 'Pedro'.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	player rollDicesWith: 14.
	self assert: player position equals: 14
]

{ #category : #tests }
PlayerTest >> testCreatePlayerWithNamePepito [
	| player |
	player := Player withName: 'Pepito'.
	self  assert: player name equals: 'Pepito';
			assert: player position equals: 0.
]

{ #category : #tests }
PlayerTest >> testMovePositionOfPlayer [
	| player |
	player := Player withName: 'John'.
	player moveForward: 10.
	self assert: player position equals: 10.
	player moveForward: 4.
	self assert:  player  position  equals: 14.
]

{ #category : #tests }
PlayerTest >> testRollDicesTwoTimes [
	| dice1 dice2 player dices type |
	type := DeterministicDice new.
	dice1 := Dice with: 6 facesAndType: type.
	dice2 := Dice with: 8 facesAndType: type.
	player := Player withName: 'Pedro'.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	player rollDices: dices.
	self assert: player position equals: 14.
	player rollDices: dices.
	self assert: player position equals: 26.
]
