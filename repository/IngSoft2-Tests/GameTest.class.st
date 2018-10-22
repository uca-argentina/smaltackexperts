Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #creation }
GameTest >> boardWith10SlotsAnd1AtomicBomb [
	| board atomicBomb |
	board := DeterministicBoard withSlots: 10.
	atomicBomb := AtomicBomb new.
	board addSpecial: atomicBomb at: 5.
	^ board
]

{ #category : #creation }
GameTest >> boardWith10SlotsAnd3MoonWalk [
	| board moonWalk|
	board := DeterministicBoard withSlots: 10.
	moonWalk  := MoonWalk   new.
	board addSpecial: moonWalk  at: 2.
	board addSpecial: moonWalk  at: 5.
	board addSpecial: moonWalk  at: 6.
	^ board
]

{ #category : #creation }
GameTest >> boardWith10SlotsAnd3SpeedUp [
	| board speedUp |
	board := DeterministicBoard withSlots: 10.
	speedUp := SpeedUp new.
	board addSpecial: speedUp at: 2.
	board addSpecial: speedUp at: 3.
	board addSpecial: speedUp at: 7.
	^ board
]

{ #category : #creation }
GameTest >> boardWith10SlotsAnd4WormHole [
	| board wormHole |
	board := DeterministicBoard withSlots: 10.
	wormHole := WormHole new.
	board addSpecial: wormHole at: 2.
	board addSpecial: wormHole at: 4.
	board addSpecial: wormHole at: 6.
	board addSpecial: wormHole at: 8.
	^ board
]

{ #category : #creation }
GameTest >> gameWith1PlayerAnd2Dices [
	| game board juan dice1 dice2 players dices |
	board := DeterministicBoard  withSlots: 20.
	juan := Player withName: 'Juan'.
	dice1 := DeterministicDice withFaces: 5 andValues: #(5 4 3 2 1).
	dice2 := DeterministicDice withFaces: 7 andValues: #(7 6 5 4 3 2 1).
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
GameTest >> gameWith1PlayerAnd3Dices [
	| game board juan dice1 dice2 dice3 players dices |
	board := DeterministicBoard withSlots: 10.
	juan := Player withName: 'Juan'.
	dice1 := DeterministicDice withFaces: 5 andValues: #(5 4 3 2 1).
	dice2 := DeterministicDice withFaces: 7 andValues: #(7 6 5 4 3 2 1).
	dice3 := DeterministicDice withFaces: 8 andValues: #(8 7 6 5 4 3 2 1).
	players := OrderedCollection new.
	players add: juan.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2;
		add: dice3.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 4.
	^ game
]

{ #category : #creation }
GameTest >> gameWith2PlayersAnd1DiceOnMoonWalk [
	| game board juan hernan dice1 players dices |
	board :=  self boardWith10SlotsAnd3MoonWalk .
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(1 4 3 5 5 5).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2.
	^ game
]

{ #category : #creation }
GameTest >> gameWith2PlayersAnd1DiceOnSpeedUpBoard [
	| game board juan hernan dice1 players dices |
	board :=  self boardWith10SlotsAnd3SpeedUp.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	dice1 := DeterministicDice withFaces: 4 andValues: #(1 2 1 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2.
	^ game
]

{ #category : #creation }
GameTest >> gameWith2PlayersAnd1DiceOnWormHoleBoard [
	| game board juan hernan dice1 players dices |
	board :=  self boardWith10SlotsAnd4WormHole.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	dice1 := DeterministicDice withFaces: 5 andValues: #(5 3 4 1 2).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2.
	^ game
]

{ #category : #creation }
GameTest >> gameWith2PlayersAnd2Dices [
	| game board juan hernan dice1 dice2 players dices |
	board := DeterministicBoard  withSlots: 20.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	dice1 := DeterministicDice withFaces: 5 andValues: #(5 4 3 2 1).
	dice2 := DeterministicDice withFaces: 7 andValues: #(7 6 5 4 3 2 1).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices withLaps: 1.
	^ game
]

{ #category : #creation }
GameTest >> gameWith3PlayersAnd1DiceOnAtomicBombBoard [
	| game board juan hernan marcelo dice1 players dices |
	board :=  self boardWith10SlotsAnd1AtomicBomb.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	marcelo := Player withName: 'Marcelo'.
	dice1 := DeterministicDice withFaces: 4 andValues: #(2 3 4 1).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: marcelo.
	dices := OrderedCollection new.
	dices add: dice1.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2.
	^ game
]

{ #category : #creation }
GameTest >> gameWith3PlayersAnd1DiceWith2laps [
	| game board juan hernan osvaldo dice1 players dices |
	board := DeterministicBoard  withSlots: 10.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	osvaldo := Player withName: 'osvaldo'.
	dice1 := DeterministicDice withFaces: 10 andValues: #(5 6 7 5 6 7 8 1 1 10).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: osvaldo.
	dices := OrderedCollection new.
	dices
		add: dice1.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2.
	^ game
]

{ #category : #creation }
GameTest >> gameWith3PlayersAnd2Dices [
	| game board juan hernan osvaldo dice1 dice2 players dices |
	board := DeterministicBoard  withSlots: 20.
	juan := Player withName: 'Juan'.
	hernan := Player withName: 'Hernan'.
	osvaldo:= Player withName: 'osvaldo'.
	dice1 := DeterministicDice withFaces: 5 andValues: #(5 4 3 2 1).
	dice2 := DeterministicDice withFaces: 7 andValues: #(7 6 5 4 3 2 1).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: osvaldo.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	game := Game on: board beeingPlayedBy: players throwing: dices withLaps: 1.
	^ game
]

{ #category : #tests }
GameTest >> testAtomicBombEffect [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd1DiceOnAtomicBombBoard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 3.
	self assert: playerAt1 lapsCompleted equals: 0.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 4.
	self assert: playerAt2 lapsCompleted equals: 0.
	game plays: playerAt3.
	self assert: playerAt1 position equals: 1.
	self assert: playerAt1 lapsCompleted equals: 0.
	self assert: playerAt2 position equals: 1.
	self assert: playerAt2 lapsCompleted equals: 0.
	self assert: playerAt3 position equals: 1.
	self assert: playerAt3 lapsCompleted equals: 0.
]

{ #category : #tests }
GameTest >> testGameCanBePlayedAndHaveAWinner [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: playerAt1 position equals:13.
	game plays: playerAt2.
	self assert: playerAt2 position equals:11.
	self assert: game isOver equals: false.
	game plays: playerAt3.
	self assert: playerAt3 position equals: 9.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 19.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 15.
	self assert: game isOver equals: false.
	game plays: playerAt3.
	self assert: playerAt3 position equals: 16.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 4.
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
		assert: game laps equals: 1.
]

{ #category : #tests }
GameTest >> testGameCreationAndPlays [
	| game players |
	game := self gameWith2PlayersAnd2Dices.
	players := game players.
	game plays: (players at:1).
	self assert: (players at:1 ) position equals:13.
	game plays: (players at:2).
	self assert: (players at:2) position equals:11.
]

{ #category : #tests }
GameTest >> testGameIsOver [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 13.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 11.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 1.
	self assert: game isOver equals: true.
]

{ #category : #tests }
GameTest >> testMoonWalkEffect [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnMoonWalk.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 2.
	self assert: playerAt1 lapsCompleted  equals:0.
	self assert: playerAt2 position equals: 10.
	self assert: playerAt2 lapsCompleted  equals: -1.
	game plays: playerAt2 .
	self assert: playerAt2 position equals: 4.
	self assert: playerAt1 position equals: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 5.
	self assert: playerAt2 position equals: 2.
	
]

{ #category : #tests }
GameTest >> testPlayerCanNotPlayWhenGameIsOver [
	| game playerAt1  playerAt2|
	game := self gameWith2PlayersAnd2Dices.
	playerAt1:= (game players at: 1).
	playerAt2:= (game players at: 2).
	game plays: playerAt1.
	self assert: playerAt1 position equals: 13.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 11.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 1.
	self assert: game isOver equals: true.
	self should: [ game plays: playerAt2 ] raise: AssertionFailure.
	self assert: playerAt2 position equals: 11
]

{ #category : #tests }
GameTest >> testPlayerCanNotPlayWhenItIsNotHisTurn [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 13.
	self assert: game isOver equals: false.
	self should: [ game plays: playerAt3 ] raise: AssertionFailure.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 11.
	self assert: game isOver equals: false
]

{ #category : #tests }
GameTest >> testPlayerPlaysAndCompleteALap [
	| game player |
	game := self gameWith1PlayerAnd2Dices.
	player := game players at: 1.
	game plays: player.
	self assert: player position equals: 13;
			assert: player lapsCompleted equals: 0.
	game plays: player.
	self assert: player position equals: 3;
			assert: player lapsCompleted equals: 1.
]

{ #category : #tests }
GameTest >> testPlayerPlaysAndCompleteTwoLaps [
	| game player |
	game := self gameWith1PlayerAnd3Dices.
	player := game players at: 1.
	game plays: player.
	self
		assert: player position equals: 1;
		assert: player lapsCompleted equals: 2
]

{ #category : #tests }
GameTest >> testPlayerPositionWhileGameIsNotOver [
| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd1DiceWith2laps.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	"game plays: playerAt1."
	game plays: (game players at:1).
	self assert: playerAt1 position equals: 6.
	"game plays: playerAt2."
	game plays: (game players at:2). 
	self assert: (game players at:2) position equals: 7.
	self assert:  (game placeOf: (game players at:2)) equals:1.
	game plays: (game players at:3) .
	self assert: (game players at:3) position equals: 8.
	self assert:  (game placeOf: (game players at:3)) equals:1.
	self assert: (game players at:1) name equals: 'Juan'.
	self assert:  (game placeOf: (game players at:2)) equals:2.
	self assert:  (game placeOf: (game players at:1)) equals:3.
	game plays: (game players at:1).
	self assert:  (game placeOf: (game players at:1)) equals:1.
	self assert:  (game placeOf: (game players at:2)) equals:3.
	self assert:  (game placeOf: (game players at:3)) equals:2.
	
	

]

{ #category : #tests }
GameTest >> testSpeedUpEffect [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnSpeedUpBoard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 6.
	game plays: playerAt2.
	self assert: playerAt2 position equals:7.	
	
]

{ #category : #tests }
GameTest >> testWhenGameEndsPlayersAreInRankingOrder [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 13.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 11.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 1.
	self assert: game isOver equals: true.
	self assert: (game placeOf: playerAt1) equals: 1.
	self assert: (game placeOf: playerAt2) equals: 2.
]

{ #category : #tests }
GameTest >> testWormHoleEffect [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnWormHoleBoard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: playerAt1 position equals: 2.
	self assert: playerAt1 lapsCompleted equals: 0.
	game plays: playerAt2.
	self assert: playerAt2 position equals: 10.
	self assert: playerAt2 lapsCompleted equals: -1.
]
