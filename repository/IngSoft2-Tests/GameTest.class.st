Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'creation-boards' }
GameTest >> boardWith10SlotsAnd1AtomicBomb [
	| board atomicBomb |
	board := DeterministicBoard withSlots: 10.
	atomicBomb := AtomicBomb new.
	board addSpecial: atomicBomb at: 5.
	^ board
]

{ #category : #'creation-boards' }
GameTest >> boardWith10SlotsAnd3CardSlots [
	| board cardSlot |
	board := DeterministicBoard withSlots: 10.
	cardSlot := CardSlot new.
	board addSpecial: cardSlot at: 3.
	board addSpecial: cardSlot at: 6.
	board addSpecial: cardSlot at: 8.
	^ board
]

{ #category : #'creation-boards' }
GameTest >> boardWith10SlotsAnd3MoonWalk [
	| board moonWalk|
	board := DeterministicBoard withSlots: 10.
	moonWalk  := MoonWalk   new.
	board addSpecial: moonWalk  at: 2.
	board addSpecial: moonWalk  at: 5.
	board addSpecial: moonWalk  at: 6.
	^ board
]

{ #category : #'creation-boards' }
GameTest >> boardWith10SlotsAnd3SpeedUp [
	| board speedUp |
	board := DeterministicBoard withSlots: 10.
	speedUp := SpeedUp new.
	board addSpecial: speedUp at: 2.
	board addSpecial: speedUp at: 3.
	board addSpecial: speedUp at: 7.
	^ board
]

{ #category : #'creation-boards' }
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

{ #category : #'creation-boards' }
GameTest >> boardWith10SlotsAndAllEffects [
	| board atomicBomb moonWalk speedUp wormHole |
	board := DeterministicBoard withSlots: 10.
	atomicBomb := AtomicBomb new.
	moonWalk := MoonWalk new.
	speedUp := SpeedUp new.
	wormHole := WormHole new.
	board addSpecial: wormHole at: 3.
	board addSpecial: speedUp at: 5.
	board addSpecial: moonWalk at: 6. 
	board addSpecial: atomicBomb at: 9.
	^ board
]

{ #category : #'creation-boards' }
GameTest >> boardWith20SlotsAndAllEffects [
	| board atomicBomb moonWalk speedUp wormHole cardSlot |
	board := DeterministicBoard withSlots: 20.
	atomicBomb := AtomicBomb new.
	moonWalk := MoonWalk new.
	speedUp := SpeedUp new.
	wormHole := WormHole new.
	cardSlot := CardSlot new.
	board addSpecial: wormHole at: 3.
	board addSpecial: cardSlot at: 5.
	board addSpecial: moonWalk at: 7. 
	board addSpecial: atomicBomb at: 9.
	board addSpecial: speedUp at: 10.
	board addSpecial: cardSlot at: 13.
	board addSpecial: speedUp at: 16.
	board addSpecial: atomicBomb at: 18.
	^ board
]

{ #category : #'creation-boards' }
GameTest >> boardWith20SlotsAndAllEffectsforRepeatCard [
	| board atomicBomb moonWalk speedUp wormHole cardSlot |
	board := DeterministicBoard withSlots: 20.
	atomicBomb := AtomicBomb new.
	moonWalk := MoonWalk new.
	speedUp := SpeedUp new.
	wormHole := WormHole new.
	cardSlot := CardSlot new.
	board addSpecial: wormHole at: 3.
	board addSpecial: speedUp  at: 5.
	board addSpecial: moonWalk at: 7.
	board addSpecial: speedUp at: 10.
	board addSpecial: cardSlot at: 13.
	board addSpecial: speedUp at: 16.
	board addSpecial: atomicBomb at: 18.
	^ board
]

{ #category : #'creation-games' }
GameTest >> gameWith1PlayerAnd2Dices [
	| game board juan dice1 dice2 players dices deckOfCards |
	board := DeterministicBoard withSlots: 20.
	juan := 'Juan'.
	dice1 := DeterministicDice withFaces: 5 andValues: #(5 4 3 2 1).
	dice2 := DeterministicDice withFaces: 7 andValues: #(7 6 5 4 3 2 1).
	players := OrderedCollection new.
	players add: juan.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	deckOfCards := DeterministicDeck new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 4
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith1PlayerAnd3Dices [
	| game board juan dice1 dice2 dice3 players dices deckOfCards |
	board := DeterministicBoard withSlots: 10.
	juan := 'Juan'.
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
		deckOfCards := DeterministicDeck new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 4
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith20RandomCards [
	| game board juan hernan dice1 players dices deckOfCards numberOfCards |
	"20 cards"
	board := self boardWith10SlotsAnd3CardSlots.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(2 5 6 5 1 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	deckOfCards := DeterministicDeck new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2Players2DicesAndDeterministicDeck [
	| game board juan hernan dice1 dice2 players dices cardsClasses deckOfCards |
	board := DeterministicBoard withSlots: 20.
	juan := 'Juan'.
	hernan := 'Hernan'.
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
	cardsClasses := OrderedCollection new.
	cardsClasses add: RedoCard new.
	cardsClasses add: RepeatCard new.
	cardsClasses add: AccelerationCard new.
	cardsClasses add: OverloadCard new.
	deckOfCards := DeterministicDeck withCards: cardsClasses.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 1
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2Players2DicesAndRandomDeck [
	| game board juan hernan dice1 dice2 players dices deckOfCards |
	board := DeterministicBoard withSlots: 20.
	juan := 'Juan'.
	hernan := 'Hernan'.
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
	deckOfCards := DeterministicDeck  new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 1
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2PlayersAnd1DiceOnBoardWithAllEffects [
	| game board juan hernan dice players dices deckOfCards |
	board := self boardWith10SlotsAndAllEffects.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice := DeterministicDice withFaces: 5 andValues: #(4 5 3 2 1).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice.
	deckOfCards := DeterministicDeck  new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2PlayersAnd1DiceOnCardSlotsAndDeterministicDeck [
	| game board juan hernan dice1 players dices deckOfCards cards |
	board := self boardWith10SlotsAnd3CardSlots.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(2 5 5 6 1 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	cards := OrderedCollection new.
	cards add: CancellationCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	cards add: SpeedCard new.
	cards add: CancellationCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	cards add: SpeedCard new.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2PlayersAnd1DiceOnCardSlotsAndRandomDeck [
	| game board juan hernan dice1 players dices deckOfCards cards |
	board := self boardWith10SlotsAnd3CardSlots.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(2 5 6 5 1 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	cards := OrderedCollection new.
	cards add: CancellationCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	cards add: SpeedCard new.
	cards add: CancellationCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	cards add: SpeedCard new.
	deckOfCards := DeterministicDeck new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2PlayersAnd1DiceOnMoonWalk [
	| game board juan hernan dice1 players dices deckOfCards |
	board := self boardWith10SlotsAnd3MoonWalk.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(1 4 3 5 5 5).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	deckOfCards := DeterministicDeck  new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2PlayersAnd1DiceOnSpeedUpBoard [
	| game board juan hernan dice1 players dices deckOfCards |
	board := self boardWith10SlotsAnd3SpeedUp.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 4 andValues: #(1 2 1 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	deckOfCards := DeterministicDeck new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith2PlayersAnd1DiceOnWormHoleBoard [
	| game board juan hernan dice1 players dices deckOfCards |
	board := self boardWith10SlotsAnd4WormHole.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 5 andValues: #(5 3 4 1 2).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	deckOfCards := DeterministicDeck  new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith3PlayersAnd1DiceOnAtomicBombBoard [
	| game board juan hernan marcelo dice1 players dices deckOfCards |
	board := self boardWith10SlotsAnd1AtomicBomb.
	juan := 'Juan'.
	hernan := 'Hernan'.
	marcelo := 'Marcelo'.
	dice1 := DeterministicDice withFaces: 4 andValues: #(2 3 4 1).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: marcelo.
	dices := OrderedCollection new.
	dices add: dice1.
	deckOfCards := DeterministicDeck  new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith3PlayersAnd1DiceOnDeterministicDeckWithRepeatCard [
	| game board juan hernan rodolfo dice players dices deckOfCards cards |
	board := self boardWith20SlotsAndAllEffects.
	juan := 'Juan'.
	hernan := 'Hernan'.
	rodolfo := 'Rodolfo'.
	dice := DeterministicDice withFaces: 10 andValues: #(2 9 6 9 7 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: rodolfo.
	dices := OrderedCollection new.
	dices add: dice.
	cards := OrderedCollection new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
		cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	cards add: RepeatCard new.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith3PlayersAnd1DiceWith2laps [
	| game board juan hernan osvaldo dice1 players dices deckOfCards |
	board := DeterministicBoard withSlots: 10.
	juan := 'Juan'.
	hernan := 'Hernan'.
	osvaldo := 'Osvaldo'.
	dice1 := DeterministicDice
		withFaces: 10
		andValues: #(5 6 7 5 6 7 8 1 1 10).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: osvaldo.
	dices := OrderedCollection new.
	dices add: dice1.
	deckOfCards := DeterministicDeck  new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith3PlayersAnd2Dices [
	| game board juan hernan osvaldo dice1 dice2 players dices deckOfCards |
	board := DeterministicBoard withSlots: 20.
	juan := 'Juan'.
	hernan := 'Hernan'.
	osvaldo := 'Osvaldo'.
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
	deckOfCards := DeterministicDeck  new.
	deckOfCards addRandomCards: 20.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 1
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards [
	| game board juan hernan rodolfo dice1 dice2 players dices deckOfCards cards |
	board := self boardWith20SlotsAndAllEffects.
	juan := 'Juan'.
	hernan := 'Hernan'.
	rodolfo := 'Rodolfo'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(2 4 5 6 1 3).
	dice2 := DeterministicDice withFaces: 7 andValues: #(2 1 7 3 4 5).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: rodolfo.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	cards := OrderedCollection new.
	cards add: AccelerationCard new.
	cards add: CancellationCard new.
	cards add: OverloadCard new.
	cards add: SpeedCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
		cards add: AccelerationCard new.
	cards add: CancellationCard new.
	cards add: OverloadCard new.
	cards add: SpeedCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCardsForRepeatCard [
	| game board juan hernan rodolfo dice1 dice2 players dices deckOfCards cards |
	board := self boardWith20SlotsAndAllEffectsforRepeatCard .
	juan := 'Juan'.
	hernan := 'Hernan'.
	rodolfo := 'Rodolfo'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(2 4 5 6 1 3).
	dice2 := DeterministicDice withFaces: 7 andValues: #(2 1 7 3 4 5).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: rodolfo.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	cards := OrderedCollection new.
	cards add: AccelerationCard new.
	cards add: CancellationCard new.
	cards add: OverloadCard new.
	cards add: SpeedCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	cards add: AccelerationCard new.
	cards add: CancellationCard new.
	cards add: OverloadCard new.
	cards add: SpeedCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'creation-games' }
GameTest >> gameWith3PlayersAnd2DicesOnDeterministicDeckWithTwoRedoCards [
	| game board juan hernan rodolfo dice1 dice2 players dices deckOfCards cards |
	board := self boardWith20SlotsAndAllEffects.
	juan := 'Juan'.
	hernan := 'Hernan'.
	rodolfo := 'Rodolfo'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(2 4 5 6 1 3).
	dice2 := DeterministicDice withFaces: 7 andValues: #(2 1 7 3 4 5).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan;
		add: rodolfo.
	dices := OrderedCollection new.
	dices
		add: dice1;
		add: dice2.
	cards := OrderedCollection new.
	cards add: RedoCard new.
	cards add: CancellationCard new.
	cards add: OverloadCard new.
	cards add: SpeedCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	cards add: RedoCard new.
	cards add: CancellationCard new.
	cards add: OverloadCard new.
	cards add: SpeedCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #'test-cards' }
GameTest >> testAPlayerCantPlayAPermanetCardWhileIsNotHisTurn [
	| game playerAt1 playerAt2 playerAt3 overloadCard speedCard accelerationCard |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	overloadCard := (game cardsOf: playerAt1) at: 1.
	self assert: overloadCard class equals: OverloadCard.
	speedCard := (game cardsOf: playerAt1) at: 2.
	self assert: speedCard class equals: SpeedCard.
	accelerationCard := (game cardsOf: playerAt2) at: 1.
	self assert: accelerationCard class equals: AccelerationCard.
	self
		should: [ game plays: playerAt2 throwing: accelerationCard ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Not this player"s turn.' ].
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	"equals 2 because there are no cards at discard deck"
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	self
		should: [ game plays: playerAt1 throwing: overloadCard to: playerAt2 ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Not this player"s turn.' ].
	self
		should: [ game plays: playerAt1 throwing: speedCard to: playerAt2 ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Not this player"s turn.' ].
	game plays: playerAt2
]

{ #category : #'test-cards' }
GameTest >> testAccelerationCard [
	| game playerAt1 playerAt2 playerAt3 card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt2) at: 1.
	self assert: card class equals: AccelerationCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	"equals 2 because there are no cards at discarDeck"
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	self
		should: [ game plays: playerAt2 throwing: card to: playerAt3 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'You don"t have to choose any player.' ].
	self
		should: [ game
				plays: playerAt2
				throwing: card
				for: ((game cardsOf: playerAt3) at: 1) ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'You don"t have to choose any card.' ].
	game plays: playerAt2 throwing: card.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt3.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 12.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2
]

{ #category : #testDiscardDeck }
GameTest >> testAddACardToDiscardDeckInAGame [
	| game card |
	game := self gameWith2Players2DicesAndDeterministicDeck.
	card := AccelerationCard.
	game addToDiscardDeck: card.
	self assert: ((game discardDeck) size )equals: 1
]

{ #category : #testDiscardDeck }
GameTest >> testAddAcardToDiscardDeck [
| d acard|

d:= DiscardDeck  new.
acard:= AccelerationCard .
d addToDiscardDeck: acard.
self assert: (d discardDeck   size) equals:1


]

{ #category : #'test-slots' }
GameTest >> testAtomicBombEffect [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd1DiceOnAtomicBombBoard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 1.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
]

{ #category : #'test-cards' }
GameTest >> testCancellationCard [
	| game playerAt1 playerAt2 playerAt3 permanentCard card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	permanentCard := (game cardsOf: playerAt1) at: 1.
	card := (game cardsOf: playerAt2) at: 2.
	self assert: card class equals: CancellationCard.
	self assert: permanentCard class equals: OverloadCard.
	game plays: playerAt1 throwing: permanentCard to: playerAt2.
	self
		should: [ game plays: playerAt2 throwing: card ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Must choose another card to throw the card.' ].
	self
		should: [ game plays: playerAt2 throwing: card to: playerAt1 ]
		raise: AssertionFailure withExceptionDo: [ :signal |
			self assert: signal messageText
			equals: 'You don"t have to choose any player.' ].
	game plays: playerAt2 throwing: card for: permanentCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: AccelerationCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2
]

{ #category : #'test-slots' }
GameTest >> testCardSlotEffectOnDeterministicDeck [
	"this test is no longer usefull. In adding cards from discardDeck to deck o cards this effect is checked"

	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnCardSlotsAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2
]

{ #category : #'test-slots' }
GameTest >> testCardSlotEffectOnRandomDeck [
	| game playerAt1 playerAt2 cardsClasses |
	game := self gameWith2PlayersAnd1DiceOnCardSlotsAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	cardsClasses := Card subclasses.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	"equals 2 because discardDeck is empty "
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self
		assert:
			((game cardsOf: playerAt1)
				allSatisfy: [ :card | cardsClasses includes: card class ]).
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self
		assert:
			((game cardsOf: playerAt1)
				allSatisfy: [ :card | cardsClasses includes: card class ])
]

{ #category : #'test-cards' }
GameTest >> testChangeLastCardPlayed [
	| game card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	card := AccelerationCard new.
	self assert: game lastCardPlayed class equals: NoCard.
	game changeLastCardPlayed: card.
	self assert: game lastCardPlayed class equals: AccelerationCard
]

{ #category : #'test-slots' }
GameTest >> testCreateAGameAndCheckLastSlotEffectActivated [
	| game playerAt1 playerAt2 emptySlot speedUp |
	game := self gameWith2PlayersAnd1DiceOnSpeedUpBoard.
	emptySlot := EmptySlot new.
	speedUp := SpeedUp new.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	self assert: (game lastSlotEffectActivated) class equals: emptySlot   class.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 6.
	self assert: (game lastSlotEffectActivated ) class equals: speedUp class .
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 7
]

{ #category : #testDiscardDeck }
GameTest >> testDiscardDeckStartsWithNoCards [
	| game  deck|
	
	game:= self gameWith2Players2DicesAndDeterministicDeck.
	deck := game discardDeck.
	self assert: (deck size) equals:0
	
	

]

{ #category : #'test-cards' }
GameTest >> testEachPlayerReceivesTwoCardsFromDeterministicDeck [
	| game playerAt1 playerAt2 cardsClasses |
	game := self gameWith2Players2DicesAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	cardsClasses := Card subclasses.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: ((game cardsOf: playerAt1) allSatisfy: [ :card | cardsClasses includes: card class ]).
	self assert: ((game cardsOf: playerAt1) at: 1) class equals: AccelerationCard.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: OverloadCard.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: ((game cardsOf: playerAt2) allSatisfy: [ :card | cardsClasses includes: card class ]).
	self assert: ((game cardsOf: playerAt2) at: 1) class equals: RedoCard.
	self assert: ((game cardsOf: playerAt2) at: 2) class equals: RepeatCard
]

{ #category : #'test-cards' }
GameTest >> testEachPlayerReceivesTwoCardsFromDeterministicDeckAndThenRemoveOne [
	| game playerAt1 playerAt2 cardsClasses card |
	game := self gameWith2Players2DicesAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	cardsClasses := Card subclasses.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self
		assert: ((game cardsOf: playerAt1) allSatisfy: [ :each | cardsClasses includes: each class ]).
	self assert: ((game cardsOf: playerAt1) at: 1) class equals: AccelerationCard.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: OverloadCard.
	card := (game cardsOf: playerAt1) at: 1.
	game remove: card from: playerAt1.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self
		assert: ((game cardsOf: playerAt2) allSatisfy: [ :each | cardsClasses includes: each class ]).
	self assert: ((game cardsOf: playerAt2) at: 1) class equals: RedoCard.
	self assert: ((game cardsOf: playerAt2) at: 2) class equals: RepeatCard.
	self assert: ((game cardsOf: playerAt1) at: 1) class equals: OverloadCard
]

{ #category : #'test-cards' }
GameTest >> testEachPlayerReceivesTwoCardsFromRandomDeck [
	| game playerAt1 playerAt2 cardsClasses |
	game := self gameWith2Players2DicesAndRandomDeck.
	cardsClasses := Card subclasses.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: ((game cardsOf: playerAt1)  allSatisfy: [ :card | cardsClasses includes: card class .]).
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: ((game cardsOf: playerAt2)  allSatisfy: [ :card | cardsClasses includes: card class .]).
]

{ #category : #'test-games' }
GameTest >> testGameCanBePlayedAndHaveAWinner [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals:13.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals:11.
	self assert: game isOver equals: false.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt3) equals: 9.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 19.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 15.
	self assert: game isOver equals: false.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt3) equals: 16.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 4.
	self assert: game isOver equals: true.
	self assert: (game placeOf: playerAt1 ) equals: 1.
	self assert: (game placeOf: playerAt3 ) equals: 2.
	self assert: (game placeOf: playerAt2 ) equals: 3.
	self assert: game winner equals: (playerAt1 ).
]

{ #category : #'test-games' }
GameTest >> testGameCreation [
	| game |
	game := self gameWith2Players2DicesAndRandomDeck.
	self
		assert: game board numberOfSlots equals:20;
		assert: game players size equals: 2;
		assert: game dices size equals: 2;
		assert: game laps equals: 1.
]

{ #category : #'test-games' }
GameTest >> testGameCreationAndPlays [
	| game players |
	game := self gameWith2Players2DicesAndRandomDeck.
	players := game players.
	game plays: (players at:1).
	self assert: (game slotOf: (players at: 1)) equals:13.
	game plays: (players at:2).
	self assert: (game slotOf: (players at: 2)) equals:11.
]

{ #category : #'test-games' }
GameTest >> testGameIsCreatedWithTheSpecificNumberOfCards [
	| game deck |
	game := self gameWith20RandomCards.
	deck := game deckOfCards.
	self assert: deck size equals: 16
	
"the game deals 4 cards to the players"
]

{ #category : #'test-games' }
GameTest >> testGameIsOver [
	| game playerAt1 playerAt2 |
	game := self gameWith2Players2DicesAndRandomDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 13.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 11.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 1.
	self assert: game isOver equals: true.
]

{ #category : #'test-slots' }
GameTest >> testGameWithAllEffects [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnBoardWithAllEffects.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self
		assert: (game slotOf: playerAt1) equals: 9;
		assert: (game lapsCompletedOf: playerAt1) equals: 0;
		assert: (game slotOf: playerAt2) equals: 1;
		assert: (game lapsCompletedOf: playerAt2) equals: 0.
	game plays: playerAt2.
	self
		assert: (game slotOf: playerAt1) equals: 6;
		assert: (game lapsCompletedOf: playerAt1) equals: 0;
		assert: (game slotOf: playerAt2) equals: 6;
		assert: (game lapsCompletedOf: playerAt2) equals: 0.
	game plays: playerAt1.
	self
		assert: (game slotOf: playerAt1) equals: 1;
		assert: (game lapsCompletedOf: playerAt1) equals: 0;
		assert: (game slotOf: playerAt2) equals: 1;
		assert: (game lapsCompletedOf: playerAt2) equals: 0.
	game plays: playerAt2.
	self
		assert: (game slotOf: playerAt1) equals: 1;
		assert: (game lapsCompletedOf: playerAt1) equals: 0;
		assert: (game slotOf: playerAt2) equals: 9;
		assert: (game lapsCompletedOf: playerAt2) equals: -1
]

{ #category : #'test-slots' }
GameTest >> testMoonWalkEffect [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnMoonWalk.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1)  equals:0.
	self assert: (game slotOf: playerAt2) equals: 10.
	self assert: (game lapsCompletedOf: playerAt2) equals: -1.
	game plays: playerAt2 .
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game slotOf: playerAt1) equals: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game slotOf: playerAt2) equals: 2.
	
]

{ #category : #'test-cards' }
GameTest >> testOverloadCard [
	| game playerAt1 playerAt2 playerAt3 card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt1) at: 1.
	self assert: card class equals: OverloadCard.
	self
		should: [ game plays: playerAt1 throwing: card ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Must choose a player to throw the card.' ].
	self
		should: [ game plays: playerAt1 throwing: card for: ((game cardsOf: playerAt3) at: 1) ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Must choose a player to throw the card, not another card.' ].
	game plays: playerAt1 throwing: card to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2
]

{ #category : #'test-cards' }
GameTest >> testPlayerCanNotPlayCancellationCardIfThereAreNotActivePermanentCards [
	| game playerAt1 playerAt2 playerAt3 permanentCard card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	permanentCard := (game cardsOf: playerAt1) at: 1.
	card := (game cardsOf: playerAt2) at: 2.
	self assert: card class equals: CancellationCard.
	self assert: permanentCard class equals: OverloadCard.
	self
		should: [ game plays: playerAt2 throwing: card for: permanentCard ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'There are not active permanent cards.' ]
]

{ #category : #'test-cards' }
GameTest >> testPlayerCanNotPlayRedoCardOnPermanentCardWhileIsNotHisTurn [
	| game playerAt1 playerAt2 playerAt3 redoCard permanentCard |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard := (game cardsOf: playerAt3) at: 1.
	permanentCard := (game cardsOf: playerAt1) at: 1.
	self assert: redoCard class equals: RedoCard.
	self assert: permanentCard class equals: OverloadCard.
	game plays: playerAt1 throwing: permanentCard to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	"equals 1 because there are no cards in discarDeck"
	self assert: (game cardsOf: playerAt3) size equals: 2.
	self
		should: [ game plays: playerAt3 throwing: redoCard to: playerAt1 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Not this player"s turn.' ]
]

{ #category : #'test-games' }
GameTest >> testPlayerCanNotPlayWhenGameIsOver [
	| game playerAt1 playerAt2 |
	game := self gameWith2Players2DicesAndRandomDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 13.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 11.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 1.
	self assert: game isOver equals: true.
	self
		should: [ game plays: playerAt2 ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'The game is over.' ].
	self assert: (game slotOf: playerAt2) equals: 11
]

{ #category : #'test-games' }
GameTest >> testPlayerCanNotPlayWhenItIsNotHisTurn [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 13.
	self assert: game isOver equals: false.
	self
		should: [ game plays: playerAt3 ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Not this player"s turn.' ].
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 11.
	self assert: game isOver equals: false
]

{ #category : #'test-cards' }
GameTest >> testPlayerCanNotThrowCardThatIsNotInHisHand [
	| game playerAt1 playerAt2 repeatCard speedCard accelerationCard |
	game := self gameWith2PlayersAnd1DiceOnCardSlotsAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	repeatCard := RepeatCard new.
	speedCard := SpeedCard new.
	accelerationCard := AccelerationCard new.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self
		should: [ game plays: playerAt1 throwing: repeatCard ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Card doesn"t belong to the player.' ].
	self
		should: [ game plays: playerAt1 throwing: speedCard to: playerAt2 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Card doesn"t belong to the player.' ].
	self
		should: [ game plays: playerAt1 throwing: accelerationCard ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | self assert: signal messageText equals: 'Card doesn"t belong to the player.' ]
]

{ #category : #'test-cards' }
GameTest >> testPlayerCanNotThrowCardWhenGameIsEnded [
	| game playerAt1 playerAt2 card |
	game := self gameWith2Players2DicesAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 13.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 11.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 1.
	self assert: game isOver equals: true.
	card := (game cardsOf: playerAt1) at: 1.
	self assert: card class equals: AccelerationCard.
	self
		should: [ game plays: playerAt1 throwing: card ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Game is over' ]
]

{ #category : #'test-games' }
GameTest >> testPlayerPlaysAndCompleteALap [
	| game player |
	game := self gameWith1PlayerAnd2Dices.
	player := game players at: 1.
	game plays: player.
	self assert: (game slotOf: player) equals: 13;
			assert: (game lapsCompletedOf: player) equals: 0.
	game plays: player.
	self assert: (game slotOf: player) equals: 3;
			assert: (game lapsCompletedOf: player) equals: 1.
]

{ #category : #'test-games' }
GameTest >> testPlayerPlaysAndCompleteTwoLaps [
	| game player |
	game := self gameWith1PlayerAnd3Dices.
	player := game players at: 1.
	game plays: player.
	self
		assert: (game slotOf: player) equals: 1;
		assert: (game lapsCompletedOf: player) equals: 2
]

{ #category : #'test-games' }
GameTest >> testPlayerPositionWhileGameIsNotOver [
| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd1DiceWith2laps.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: (game players at:1).
	self assert: (game slotOf: playerAt1) equals: 6.
	game plays: (game players at:2). 
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert:  (game placeOf: (game players at:2)) equals:1.
	game plays: (game players at:3) .
	self assert: (game slotOf: playerAt3) equals: 8.
	self assert:  (game placeOf: (game players at:3)) equals:1.
	self assert:  (game placeOf: (game players at:2)) equals:2.
	self assert:  (game placeOf: (game players at:1)) equals:3.
	game plays: (game players at:1).
	self assert:  (game placeOf: (game players at:1)) equals:1.
	self assert:  (game placeOf: (game players at:2)) equals:3.
	self assert:  (game placeOf: (game players at:3)) equals:2.
	
	

]

{ #category : #'test-cards' }
GameTest >> testRedoCardOnAccelerationCard [
	| game playerAt1 playerAt2 playerAt3 redoCard accelerationCard|
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard := (game cardsOf: playerAt3) at: 1.
	self assert: redoCard class equals: RedoCard. 
	accelerationCard :=(game cardsOf: playerAt2) at: 1.
	self assert: accelerationCard class equals: AccelerationCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt2 throwing: accelerationCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt3 throwing: redoCard.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 12.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 1.
	
	
]

{ #category : #'test-cards' }
GameTest >> testRedoCardOnCancellationCard [
	| game playerAt1 playerAt2 playerAt3 redoCard cancellationCard accelerationCard overloadCard |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard := (game cardsOf: playerAt3) at: 1.
	cancellationCard := (game cardsOf: playerAt2) at: 2.
	accelerationCard := (game cardsOf: playerAt2) at: 1.
	overloadCard := (game cardsOf: playerAt1) at: 1.
	self assert: redoCard class equals: RedoCard.
	self assert: cancellationCard class equals: CancellationCard.
	self assert: accelerationCard class equals: AccelerationCard.
	self assert: overloadCard class equals: OverloadCard.
	game plays: playerAt1 throwing: overloadCard to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt2 throwing: accelerationCard.
	game plays: playerAt2 throwing: cancellationCard for: overloadCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 0.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt3 throwing: redoCard for: accelerationCard.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 14.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 0.
	self assert: (game cardsOf: playerAt3) size equals: 1.
	self assert: game discardDeck size equals: 4
]

{ #category : #'test-cards' }
GameTest >> testRedoCardOnNoCard [
	| game playerAt1 playerAt2 playerAt3 redoCard speedCard |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard := (game cardsOf: playerAt3) at: 1.
	speedCard := (game cardsOf: playerAt1) at: 2.
	self assert: redoCard class equals: RedoCard.
	self assert: speedCard class equals: SpeedCard.
	self
		should: [ game plays: playerAt3 throwing: redoCard to: playerAt2 ]
		raise: AssertionFailure
		withExceptionDo: [ :singal | self assert: singal messageText equals: 'No card was thrown before.' ]
]

{ #category : #'test-cards' }
GameTest >> testRedoCardOnOverloadCard [
	| game playerAt1 playerAt2 playerAt3 card card2 |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt3) at: 1.
	card2 := (game cardsOf: playerAt1) at: 1.
	self assert: card class equals: RedoCard.
	self assert: card2 class equals: OverloadCard.
	game plays: playerAt1 throwing: card2 to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	self
		should: [ game plays: playerAt3 throwing: card for: ((game cardsOf: playerAt1) at: 1) ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Must choose a player to throw the card, not another card.' ].
	self
		should: [ game plays: playerAt3 throwing: card ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Must choose a player to throw the card.' ].
	game plays: playerAt3 throwing: card to: playerAt1.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 13.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 1
]

{ #category : #'test-cards' }
GameTest >> testRedoCardOnRedoCard [
	| game playerAt1 playerAt2 playerAt3 redoCard1 redoCard2 overloadCard |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithTwoRedoCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard1 := (game cardsOf: playerAt3) at: 1.
	redoCard2 := (game cardsOf: playerAt2) at: 1.
	overloadCard := (game cardsOf: playerAt1) at: 1.
	self assert: redoCard1 class equals: RedoCard.
	self assert: redoCard2 class equals: RedoCard.
	self assert: overloadCard class equals: OverloadCard.
	game plays: playerAt1 throwing: overloadCard to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt2 throwing: redoCard2 to: playerAt3.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt3 throwing: redoCard1 to: playerAt1.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 1.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 12.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 1.
]

{ #category : #'test-cards' }
GameTest >> testRedoCardOnRepeatCard [
	| game playerAt1 playerAt2 playerAt3 redoCard repeatCard |
	game := self
		gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCardsForRepeatCard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard := (game cardsOf: playerAt3) at: 1.
	repeatCard := (game cardsOf: playerAt3) at: 2.
	self assert: redoCard class equals: RedoCard.
	self assert: repeatCard class equals: RepeatCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 9.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt3 throwing: repeatCard.
	self assert: (game slotOf: playerAt1) equals: 13.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 1.
	game plays: playerAt3 throwing: redoCard.
	self assert: (game slotOf: playerAt1) equals: 17.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	
]

{ #category : #'test-cards' }
GameTest >> testRedoCardOnSpeedCard [
	| game playerAt1 playerAt2 playerAt3 redoCard speedCard |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard := (game cardsOf: playerAt3) at: 1.
	speedCard := (game cardsOf: playerAt1) at: 2.
	self assert: redoCard class equals: RedoCard.
	self assert: speedCard class equals: SpeedCard.
	game plays: playerAt1 throwing: speedCard to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt3 throwing: redoCard to: playerAt3.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 1.
]

{ #category : #'test-cards' }
GameTest >> testRepeatCard [
	| game playerAt1 playerAt2 playerAt3 card discardCard |
	game := self
		gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCardsForRepeatCard.
	discardCard := AccelerationCard new.
	game addToDiscardDeck: discardCard.
	"i add this card to not change de full test. If there are no cards  at discard deckthe effects do nothing"
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt3) at: 2.
	self assert: card class equals: RepeatCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 9.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	"is 2 instead of 3 because there are no cards in discarDeck"
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	self
		should: [ game
				plays: playerAt3
				throwing: card
				for: ((game cardsOf: playerAt1) at: 1) ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'You don"t have to choose any card.' ].
	self
		should: [ game plays: playerAt3 throwing: card to: playerAt1 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'You don"t have to choose any player.' ].
	game plays: playerAt3 throwing: card.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 13.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 1
]

{ #category : #'test-cards' }
GameTest >> testRepeatCardWithAllEffects [
	| game playerAt1 playerAt2 playerAt3 card1 card2 card3 card4 |
	game := self gameWith3PlayersAnd1DiceOnDeterministicDeckWithRepeatCard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card1 := (game cardsOf: playerAt1) at: 1.
	card2 := (game cardsOf: playerAt2) at: 1.
	card3 := (game cardsOf: playerAt3) at: 1.
	card4 := (game cardsOf: playerAt1) at: 2.
	self assert: card1 class equals: RepeatCard.
	self assert: card2 class equals: RepeatCard.
	self assert: card3 class equals: RepeatCard.
	self assert: card4 class equals: RepeatCard. 
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 19.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt2 throwing: card2.
	self assert: (game slotOf: playerAt1) equals: 15.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 14.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt1 throwing: card1.
	self assert: (game slotOf: playerAt2) equals: 18.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 12.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	self assert: (game slotOf: playerAt2) equals: 15.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 7.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 2.
	game plays: playerAt3 throwing: card3.
	self assert: (game slotOf: playerAt1) equals: 9.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	self assert: (game slotOf: playerAt2) equals: 12.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 7.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 1.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 1.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	game plays: playerAt1 throwing: card4.
	self assert: (game slotOf: playerAt1) equals: 1.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 0.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: (game cardsOf: playerAt3) size equals: 1.
]

{ #category : #'test-cards' }
GameTest >> testSpeedCard [
	| game playerAt1 playerAt2 playerAt3 card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt1) at: 2.
	self assert: card class equals: SpeedCard.
	self
		should: [ game plays: playerAt1 throwing: card ]
		raise: AssertionFailure
		withExceptionDo:
			[ :signal | self assert: signal messageText equals: 'Must choose a player to throw the card.' ].
	self
		should: [ game plays: playerAt1 throwing: card for: ((game cardsOf: playerAt3) at: 1) ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Must choose a player to throw the card, not another card.' ].
	game plays: playerAt1 throwing: card to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	"is 1 because the discard deck has no cards and player 1 don't recive a card from cardSlot"
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2.

	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game cardsOf: playerAt1) size equals: 1.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	self assert: (game cardsOf: playerAt3) size equals: 2
]

{ #category : #'test-slots' }
GameTest >> testSpeedUpEffect [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnSpeedUpBoard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 6.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals:7.	
	
]

{ #category : #'test-games' }
GameTest >> testWhenGameEndsPlayersAreInRankingOrder [
	| game playerAt1 playerAt2 |
	game := self gameWith2Players2DicesAndRandomDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 13.
	self assert: game isOver equals: false.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 11.
	self assert: game isOver equals: false.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 1.
	self assert: game isOver equals: true.
	self assert: (game placeOf: playerAt1) equals: 1.
	self assert: (game placeOf: playerAt2) equals: 2.
]

{ #category : #'test-slots' }
GameTest >> testWormHoleEffect [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnWormHoleBoard.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 10.
	self assert: (game lapsCompletedOf: playerAt2) equals: -1.
]

{ #category : #testDiscardDeck }
GameTest >> testinstantCardGoToDiscardDeckAfterBeingPlayed [
	| game playerAt1 playerAt2 playerAt3 permanentCard card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	permanentCard := (game cardsOf: playerAt1) at: 1.
	card := (game cardsOf: playerAt2) at: 2.
	self assert: card class equals: CancellationCard.
	self assert: permanentCard class equals: OverloadCard.
	game plays: playerAt1 throwing: permanentCard to: playerAt2.
	self
		should: [ game plays: playerAt2 throwing: card ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Must choose another card to throw the card.' ].
	self
		should: [ game plays: playerAt2 throwing: card to: playerAt1 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'You don"t have to choose any player.' ].
	game plays: playerAt2 throwing: card for: permanentCard.
	game plays: playerAt1.
	self
		assert: ((game cardsOf: playerAt1) at: 2) class
		equals: AccelerationCard.
	game plays: playerAt2.
	self assert: game discardDeck size equals: 2
]
