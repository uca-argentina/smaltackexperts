Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #action }
GameTest >> gameWith1PlayerAnd2Dices [
	| game board juan dice1 dice2 players dices |
	board := Board withSlots: 20.
	juan := Player withName: 'Juan'.
	dice1 := DeterministicDice withFaces: 5.
	dice2 := DeterministicDice withFaces: 7.
	players := OrderedCollection new.
	players
		add: juan.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices withLaps: 4.
	^ game
]

{ #category : #creation }
GameTest >> gameWith2PlayersAnd2Dices [
	| game board juan hernan dice1 dice2 players dices |
	board := Board withSlots: 20.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	dice1 := DeterministicDice withFaces: 5.
	dice2 := DeterministicDice withFaces: 7.
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices withLaps: 4.
	^ game
]

{ #category : #creation }
GameTest >> gameWith3PlayersAnd2Dices [
	| game board juan hernan osvaldo dice1 dice2 players dices |
	board := Board withSlots: 20.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	osvaldo:= Player withName: 'osvaldo'.
	dice1 := DeterministicDice withFaces: 5.
	dice2 := DeterministicDice withFaces: 7.
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: osvaldo.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices withLaps: 3.
	^ game
]

{ #category : #tests }
GameTest >> testGameCanBePlayedAndHaveAWinner [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: playerAt1 position equals:12.
	game plays: playerAt2.
	self assert: playerAt2 position equals:10.
	self assert: game isOver equals: false.
	game plays: playerAt3.
	self assert: playerAt3 position equals: 8.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 18.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 14.
	self assert: game isOver equals: false.
	game plays: playerAt3.
	self assert: playerAt3 position equals: 15.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 23.
	self assert: game isOver equals: true.
	self assert: (game placeOf: playerAt1 ) equals: 1.
	self assert: (game placeOf: playerAt3 ) equals: 2.
	self assert: (game placeOf: playerAt2 ) equals: 3.
	self assert: game winner equals: (playerAt1 ).
]

{ #category : #tests }
GameTest >> testGameCreation [
	| game |
	game := self gameWith2PlayersAnd2Dices.
	self
		assert: game board numberOfSlots equals:20;
		assert: game players size equals: 2;
		assert: game dices size equals: 2;
		assert: game laps equals: 4.
]

{ #category : #tests }
GameTest >> testGameCreationAndPlays [
	| game players |
	game := self gameWith2PlayersAnd2Dices.
	players := game players.
	game plays: (players at:1).
	self assert: (players at:1 ) position equals:12.
	game plays: (players at:2).
	self assert: (players at:2) position equals:10.
]

{ #category : #tests }
GameTest >> testGameIsOver [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 12.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 10.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 20.
	self assert: game isOver equals: true
]

{ #category : #tests }
GameTest >> testPlayerCanNotPlayWhenGameIsOver [
	| game playerAt1  playerAt2|
	game := self gameWith2PlayersAnd2Dices.
	playerAt1:= (game players at: 1).
	playerAt2:= (game players at: 2).
	game plays: playerAt1.
	self assert: playerAt1 position equals: 12.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 10.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 20.
	self assert: game isOver equals: true.
	self should: [ game plays: playerAt2 ] raise: AssertionFailure.
	self assert: playerAt2 position equals: 10
]

{ #category : #tests }
GameTest >> testPlayerCanNotPlayWhenItIsNotHisTurn [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 12.
	self assert: game isOver equals: false.
	self should: [ game plays: playerAt3 ] raise: AssertionFailure.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 10.
	self assert: game isOver equals: false
]

{ #category : #tests }
GameTest >> testPlayerPlaysAndLapChanges [
	| game player |
	game := self gameWith1PlayerAnd2Dices.
	player := game players at: 1.
	game plays: player.
	self assert: player position equals: 12;
			assert: player lap equals: 1.
	game plays: player.
	self assert: player position equals: 2;
			assert: player lap equals: 2.
]

{ #category : #tests }
GameTest >> testWhenGameEndsPlayersAreInRankingOrder [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 12.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 10.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 20.
	self assert: game isOver equals: true.
	self assert: (game placeOf: playerAt1) equals: 1.
	self assert: (game placeOf: playerAt2) equals: 2.
]
