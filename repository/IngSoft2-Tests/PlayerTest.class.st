Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testAPlayerRollDicesAndMoveForwards [
	| dice1 dice2 pedro dices board |
	dice1 := DeterministicDice withFaces: 8 andValues: #(8 7 6 5 4 3 2 1).
	dice2 := DeterministicDice withFaces: 6 andValues: #(6 5 4 3 2 1).
	pedro := Player withName: 'Pedro'.
	board := RandomBoard withSlots: 30.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	pedro rollDices: dices on: board.
	self assert: pedro position equals: 15.
	pedro rollDices: dices on: board.
	self assert: pedro position equals: 27.
]

{ #category : #tests }
PlayerTest >> testCreatePlayer [
	| pepito |
	pepito := Player withName: 'Pepito'.
	self  assert: pepito name equals: 'Pepito';
			assert: pepito position equals: 1;
			assert: pepito lapsCompleted equals: 0.
]

{ #category : #tests }
PlayerTest >> testMovePositionOfPlayer [
	| john board |
	john := Player withName: 'John'.
	board := RandomBoard withSlots: 20.
	john moveForward: 10 on: board.
	self assert: john position equals: 11.
	john moveForward: 4 on: board.
	self assert: john position equals: 15
]

{ #category : #tests }
PlayerTest >> testRollDicesTwoTimes [
	| dice1 dice2 pedro dices board |
	dice1 := DeterministicDice withFaces: 6 andValues: #(6 5 4 3 2 1).
	dice2 := DeterministicDice withFaces: 8 andValues: #(8 7 6 5 4 3 2 1).
	pedro := Player withName: 'Pedro'.
	board := RandomBoard withSlots: 30.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	pedro rollDices: dices on: board.
	self assert: pedro position equals: 15.
	pedro rollDices: dices on: board.
	self assert: pedro position equals: 27
]
