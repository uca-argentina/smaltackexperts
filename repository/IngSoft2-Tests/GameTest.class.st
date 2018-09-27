Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> testCheckWhoWins [
	| game board player1 player2 player3 dice1 dice2 players dices |
	board := Board withNumberOfLockers: 20.
	player1 := Player withName: 'Juan'.
	player2 := Player withName: 'Hernan'.
	player3 := Player withName: 'luis'.
	dice1 := Dice with: 5 facesAndType: DeterministicDice new.
	dice2 := Dice with: 7 facesAndType: DeterministicDice new.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2;
		add: player3.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices.
	game plays: player1.
	self assert: player1 position equals: 12.
	self assert: game isOver equals: false.
	game plays: player2.
	self assert: player2 position equals: 10.
	self assert: game isOver equals: false.
	game plays: player3.
	self assert: player3 position equals: 8.
	self assert: game isOver equals: false.
	game plays: player1.
	self assert: player1 position equals: 18.
	self assert: game isOver equals: false.
	game plays: player2.
	self assert: player2 position equals: 14.
	self assert: game isOver equals: false.
	game plays: player3.
	self assert: player3 position equals: 15.
	self assert: game isOver equals: false.
	game plays: player1.
	self assert: player1 position equals: 23.
	self assert: game isOver equals: true.
	self assert: (game placeOf: player1) equals: 1.
	self assert: (game placeOf: player3) equals: 2.
	self assert: (game placeOf: player2) equals: 3.
	self assert: game winner equals: player1.
]

{ #category : #tests }
GameTest >> testCreateGame2 [
	| game board player1 player2 player3 dice1 dice2 players dices type |
	board := Board withNumberOfLockers: 20.
	player1 := Player withName: 'Juan'.
	player2 := Player withName: 'Hernan'.
	player3 := Player withName: 'luis'.
	type := DeterministicDice new.
	dice1 := Dice with: 5 facesAndType: type.
	dice2 := Dice with: 7 facesAndType: type.
	players := OrderedCollection new.
	players
		add: player1;
		add: player2;
		add: player3.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices.
	self
		assert: game board equals: board;
		assert: game players size equals: 3;
		assert: game dices size equals: 2.
]

{ #category : #tests }
GameTest >> testGameIsOver [
	| game board player1 player2 dice1 dice2 players dices  type|
	board := Board withNumberOfLockers: 20.
	player1 := Player withName: 'Juan'.
	player2 := Player withName: 'Hernan'.
	type:= DeterministicDice new.
	dice1 := Dice with: 5 facesAndType: type.
	dice2 := Dice with: 7 facesAndType: type. 
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices.
	game plays: player1.
	self assert: player1 position equals: 12.
	self assert: game isOver equals: false.
	game plays: player2.
	self assert: player2 position equals: 10.
	self assert: game isOver equals: false.
	game plays: player1.
	self assert: player1 position equals: 20.
	self assert: game isOver equals: true
]

{ #category : #tests }
GameTest >> testOrderArrayOfPlayerAfterAGame [
	| game board player1 player2 dice1 dice2 players dices  type|
	board := Board withNumberOfLockers: 15.
	player1 := Player withName: 'Juan'.
	player2 := Player withName: 'Hernan'.
	type:= DeterministicDice new.
	dice1 := Dice with: 5 facesAndType: type.
	dice2 := Dice with: 7 facesAndType: type. 
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices.
	game plays: player1.
	self assert: player1 position equals: 12.
	self assert: game isOver equals: false.
	game plays: player2.
	self assert: player2 position equals: 10.
	self assert: game isOver equals: false.
	game plays: player1.
	self assert: player1 position equals: 20.
	self assert: game isOver equals: true.
	self assert: (game placeOf: player1) equals: 1.
	self assert: (game placeOf: player2) equals: 2.
]

{ #category : #tests }
GameTest >> testPlayerCanNotPlayWhenGameIsOver [
	| game board player1 player2 dice1 dice2 players dices  type|
	board := Board withNumberOfLockers: 20.
	player1 := Player withName: 'Juan'.
	player2 := Player withName: 'Hernan'.
	type:= DeterministicDice new.
	dice1 := Dice with: 8 facesAndType: type.
	dice2 := Dice with: 9 facesAndType: type. 
	players := OrderedCollection new.
	players
		add: player1;
		add: player2.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices.
	game plays: player1.
	self assert: player1 position equals: 17.
	self assert: game isOver equals: false.
	game plays: player2.
	self assert: player2 position equals: 15.
	self assert: game isOver equals: false.
	game plays: player1.
	self assert: player1 position equals: 30.
	self assert: game isOver equals: true.
	self should: [ game plays: player2. ] raise: AssertionFailure.
	self assert: player2 position equals: 15.
]

{ #category : #tests }
GameTest >> testPlayerCanNotPlayWhenItIsNotHisTurn [
	| game board player1 player2 player3 dice1 dice2 players dices  type|
	board := Board withNumberOfLockers: 20.
	player1 := Player withName: 'Juan'.
	player2 := Player withName: 'Hernan'.
	player3:= Player withName: 'carlos.'.
	type:= DeterministicDice new.
	dice1 := Dice with: 5 facesAndType: type.
	dice2 := Dice with: 7 facesAndType: type. 
	players := OrderedCollection new.
	players
		add: player1;
		add: player2;
		add: player3.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices.
	game plays: player1.
	self assert: player1 position equals: 12.
	self assert: game isOver equals: false.
	self should: [ game plays: player3 ] raise: AssertionFailure.
	game plays: player2.
	self assert: player2 position equals: 10.
	self assert: game isOver equals: false
]
