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
GameTest >> boardWith10SlotsAnd3CardSlots [
	| board cardSlot |
	board := DeterministicBoard withSlots: 10.
	cardSlot := CardSlot new.
	board addSpecial: cardSlot at: 3.
	board addSpecial: cardSlot at: 6.
	board addSpecial: cardSlot at: 8.
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

{ #category : #creation }
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

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 4
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 4
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	cardsClasses add: RedoCard.
	cardsClasses add: RepeatCard.
	cardsClasses add: AccelerationCard.
	cardsClasses add: OverloadCard.
	deckOfCards := DeterministicDeck withCards: cardsClasses.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 1
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 1
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	cards add: CancellationCard.
	cards add: RedoCard.
	cards add: RepeatCard.
	cards add: SpeedCard.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	cards add: CancellationCard.
	cards add: RedoCard.
	cards add: RepeatCard.
	cards add: SpeedCard.
	deckOfCards := RandomDeck.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	dices
		add: dice.
	cards := OrderedCollection new.
	cards add: RepeatCard.
	cards add: RepeatCard.
	cards add: RepeatCard.
	cards add: RepeatCard.
	cards add: RepeatCard.
	cards add: RepeatCard.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	deckOfCards := RandomDeck new.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 1
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	cards add: AccelerationCard.
	cards add: CancellationCard.
	cards add: OverloadCard.
	cards add: SpeedCard.
	cards add: RedoCard.
	cards add: RepeatCard.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #creation }
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
	cards add: RedoCard.
	cards add: CancellationCard.
	cards add: OverloadCard.
	cards add: SpeedCard.
	cards add: RedoCard.
	cards add: RepeatCard.
	deckOfCards := DeterministicDeck withCards: cards.
	game := Game
		on: board
		beeingPlayedBy: players
		throwing: dices
		withLaps: 2
		and: deckOfCards.
	^ game
]

{ #category : #tests }
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
	self should: [ game plays: playerAt2 throwing: accelerationCard ] raise: AssertionFailure.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	self
		should: [ game plays: playerAt1 throwing: OverloadCard to: playerAt2 ]
		raise: AssertionFailure.
	self
		should: [ game plays: playerAt1 throwing: SpeedCard to: playerAt2 ]
		raise: AssertionFailure.
	game plays: playerAt2
]

{ #category : #tests }
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 3) class equals: AccelerationCard.
	self should: [ game plays: playerAt2 throwing: card to: playerAt3 ] raise: AssertionFailure.
	self should: [ game plays: playerAt2 throwing: card for: ((game cardsOf: playerAt3) at: 1) ] raise: AssertionFailure.
	game plays: playerAt2 throwing: card.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 12.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
]

{ #category : #tests }
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

{ #category : #tests }
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
	self should: [ game plays: playerAt2 throwing: card ] raise: AssertionFailure.
	self should: [ game plays: playerAt2 throwing: card to: playerAt1 ] raise: AssertionFailure.
	game plays: playerAt2 throwing: card for: permanentCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: AccelerationCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2
]

{ #category : #tests }
GameTest >> testCardSlotEffectOnDeterministicDeck [
	| game playerAt1 playerAt2 |
	game := self gameWith2PlayersAnd1DiceOnCardSlotsAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 3) class equals: CancellationCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 3.
	self assert: ((game cardsOf: playerAt2) at: 3) class equals: RedoCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 8.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 4.
	self assert: (game numberOfCardsOf: playerAt2) equals: 3.
	self assert: ((game cardsOf: playerAt1) at: 4) class equals: RepeatCard.
]

{ #category : #tests }
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: ((game cardsOf: playerAt1)  allSatisfy: [ :card | cardsClasses includes: card class .]).
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 3.
	self assert: ((game cardsOf: playerAt1)  allSatisfy: [ :card | cardsClasses includes: card class .]).
]

{ #category : #tests }
GameTest >> testChangeLastCardPlayed [
	| game card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	card := AccelerationCard new.
	self assert: game lastCardPlayed class equals: NoCard.
	game changeLastCardPlayed: card.
	self assert: game lastCardPlayed class equals: AccelerationCard
]

{ #category : #tests }
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

{ #category : #tests }
GameTest >> testEachPlayerReceivesTwoCardsFromDeterministicDeck [
	| game playerAt1 playerAt2 cardsClasses |
	game := self gameWith2Players2DicesAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	cardsClasses := Card subclasses.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: ((game cardsOf: playerAt1) allSatisfy: [ :card | cardsClasses includes: card class ]).
	self assert: ((game cardsOf: playerAt1) at: 1) class equals: AccelerationCard.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: OverloadCard.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: ((game cardsOf: playerAt2) allSatisfy: [ :card | cardsClasses includes: card class ]).
	self assert: ((game cardsOf: playerAt2) at: 1) class equals: RedoCard.
	self assert: ((game cardsOf: playerAt2) at: 2) class equals: RepeatCard
]

{ #category : #tests }
GameTest >> testEachPlayerReceivesTwoCardsFromDeterministicDeckAndThenRemoveOne [
	| game playerAt1 playerAt2 cardsClasses card |
	game := self gameWith2Players2DicesAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	cardsClasses := Card subclasses.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self
		assert: ((game cardsOf: playerAt1) allSatisfy: [ :each | cardsClasses includes: each class ]).
	self assert: ((game cardsOf: playerAt1) at: 1) class equals: AccelerationCard.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: OverloadCard.
	card := (game cardsOf: playerAt1) at: 1.
	game remove: card from: playerAt1.
	self assert: (game numberOfCardsOf: playerAt1) equals: 1.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self
		assert: ((game cardsOf: playerAt2) allSatisfy: [ :each | cardsClasses includes: each class ]).
	self assert: ((game cardsOf: playerAt2) at: 1) class equals: RedoCard.
	self assert: ((game cardsOf: playerAt2) at: 2) class equals: RepeatCard.
	self assert: ((game cardsOf: playerAt1) at: 1) class equals: OverloadCard
]

{ #category : #tests }
GameTest >> testEachPlayerReceivesTwoCardsFromRandomDeck [
	| game playerAt1 playerAt2 cardsClasses |
	game := self gameWith2Players2DicesAndRandomDeck.
	cardsClasses := Card subclasses.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: ((game cardsOf: playerAt1)  allSatisfy: [ :card | cardsClasses includes: card class .]).
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: ((game cardsOf: playerAt2)  allSatisfy: [ :card | cardsClasses includes: card class .]).
]

{ #category : #tests }
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

{ #category : #tests }
GameTest >> testGameCreation [
	| game |
	game := self gameWith2Players2DicesAndRandomDeck.
	self
		assert: game board numberOfSlots equals:20;
		assert: game players size equals: 2;
		assert: game dices size equals: 2;
		assert: game laps equals: 1.
]

{ #category : #tests }
GameTest >> testGameCreationAndPlays [
	| game players |
	game := self gameWith2Players2DicesAndRandomDeck.
	players := game players.
	game plays: (players at:1).
	self assert: (game slotOf: (players at: 1)) equals:13.
	game plays: (players at:2).
	self assert: (game slotOf: (players at: 2)) equals:11.
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
GameTest >> testOverloadCard [
	| game playerAt1 playerAt2 playerAt3 card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt1) at: 1.
	self assert: card class equals: OverloadCard.
	self should: [ game plays: playerAt1 throwing: card ] raise: AssertionFailure.
	self should: [ game plays: playerAt1 throwing: card for: ((game cardsOf: playerAt3) at: 1) ] raise: AssertionFailure.
	game plays: playerAt1 throwing: card to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: AccelerationCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
]

{ #category : #tests }
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
	self should: [ game plays: playerAt2 throwing: card for: permanentCard. ] raise: AssertionFailure.
]

{ #category : #tests }
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
	self should: [ game plays: playerAt2 ] raise: AssertionFailure.
	self assert: (game slotOf: playerAt2) equals: 11
]

{ #category : #tests }
GameTest >> testPlayerCanNotPlayWhenItIsNotHisTurn [
	| game playerAt1 playerAt2 playerAt3 |
	game := self gameWith3PlayersAnd2Dices.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 13.
	self assert: game isOver equals: false.
	self should: [ game plays: playerAt3 ] raise: AssertionFailure.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 11.
	self assert: game isOver equals: false
]

{ #category : #tests }
GameTest >> testPlayerCanNotThrowCardThatIsNotInHisHand [
	| game playerAt1 playerAt2 repeatCard speedCard accelerationCard |
	game := self gameWith2PlayersAnd1DiceOnCardSlotsAndDeterministicDeck.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	repeatCard  := RepeatCard new.
	speedCard := SpeedCard new.
	accelerationCard := AccelerationCard new.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 3) class equals: CancellationCard.
	self should: [ game plays: playerAt1 throwing: repeatCard ] raise: AssertionFailure.
	self should: [ game plays: playerAt1 throwing: speedCard to: playerAt2 ] raise: AssertionFailure.
	self should: [ game plays: playerAt1 throwing: accelerationCard ] raise: AssertionFailure.
]

{ #category : #tests }
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
	self should: [ game plays: playerAt1 throwing: card ] raise: AssertionFailure.
]

{ #category : #tests }
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

{ #category : #tests }
GameTest >> testPlayerPlaysAndCompleteTwoLaps [
	| game player |
	game := self gameWith1PlayerAnd3Dices.
	player := game players at: 1.
	game plays: player.
	self
		assert: (game slotOf: player) equals: 1;
		assert: (game lapsCompletedOf: player) equals: 2
]

{ #category : #tests }
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

{ #category : #tests }
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt2 throwing: accelerationCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3 throwing: redoCard.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 12.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
	
	
]

{ #category : #tests }
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt2 throwing: accelerationCard.
	game plays: playerAt2 throwing: cancellationCard for: overloadCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 0.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3 throwing: redoCard for: accelerationCard.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 14.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 0.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
]

{ #category : #tests }
GameTest >> testRedoCardOnOverloadCard [
	| game playerAt1 playerAt2 playerAt3 card card2|
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt3) at: 1.
	card2 := (game cardsOf: playerAt1) at: 1.
	self assert: card class equals: RedoCard.
	self assert: card2 class equals: OverloadCard.
	self should: [ game plays: playerAt3 throwing: card for: ((game cardsOf: playerAt1) at: 1)  ] raise: AssertionFailure.
	self should: [ game plays: playerAt3 throwing: card ] raise: AssertionFailure.
	game plays: playerAt1 throwing: card2 to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3 throwing: card to: playerAt1.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 13.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
]

{ #category : #tests }
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt2 throwing: redoCard2 to: playerAt3.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3 throwing: redoCard1 to: playerAt1.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 12.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 4.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
]

{ #category : #tests }
GameTest >> testRedoCardOnRepeatCard [
	| game playerAt1 playerAt2 playerAt3 redoCard repeatCard |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	redoCard := (game cardsOf: playerAt3) at: 1.
	repeatCard := (game cardsOf: playerAt3) at: 2.
	self assert: redoCard class equals: RedoCard.
	self assert: repeatCard class equals: RepeatCard.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3 throwing: repeatCard.
	self assert: (game numberOfCardsOf: playerAt1) equals: 4.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
	game plays: playerAt3 throwing: redoCard.
	self assert: (game numberOfCardsOf: playerAt1) equals: 5.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 0.
]

{ #category : #tests }
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3 throwing: redoCard to: playerAt3.
	game plays: playerAt3.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 11.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
]

{ #category : #tests }
GameTest >> testRepeatCard [
	| game playerAt1 playerAt2 playerAt3 card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt3) at: 2.
	self assert: card class equals: RepeatCard. 
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 3.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 3) class equals: AccelerationCard.
	self should: [ game plays: playerAt3 throwing: card for: ((game cardsOf: playerAt1) at: 1)  ] raise: AssertionFailure.
	self should: [ game plays: playerAt3 throwing: card to: playerAt1 ] raise: AssertionFailure.
	game plays: playerAt3 throwing: card.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 6.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 4.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1
]

{ #category : #tests }
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt2 throwing: card2.
	self assert: (game slotOf: playerAt1) equals: 15.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt2) equals: 14.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 1.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	game plays: playerAt3 throwing: card3.
	self assert: (game slotOf: playerAt1) equals: 9.
	self assert: (game lapsCompletedOf: playerAt1) equals: -1.
	self assert: (game slotOf: playerAt2) equals: 12.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 7.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 1.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
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
	self assert: (game numberOfCardsOf: playerAt1) equals: 0.
	self assert: (game numberOfCardsOf: playerAt2) equals: 1.
	self assert: (game numberOfCardsOf: playerAt3) equals: 1.
]

{ #category : #tests }
GameTest >> testSpeedCard [
	| game playerAt1 playerAt2 playerAt3 card |
	game := self gameWith3PlayersAnd2DicesOnDeterministicDeckWithAllCards.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	playerAt3 := game players at: 3.
	card := (game cardsOf: playerAt1) at: 2.
	self assert: card class equals: SpeedCard.
	self should: [ game plays: playerAt1 throwing: card ] raise: AssertionFailure.
	self should: [ game plays: playerAt1 throwing: card for: ((game cardsOf: playerAt3) at: 1) ] raise: AssertionFailure.
	game plays: playerAt1 throwing: card to: playerAt2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 5.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 1.
	self assert: (game lapsCompletedOf: playerAt3) equals: 0.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt3) equals: 2.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: AccelerationCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 2.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 7.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game slotOf: playerAt3) equals: 18.
	self assert: (game lapsCompletedOf: playerAt3) equals: -1.
	self assert: (game numberOfCardsOf: playerAt1) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
	self assert: (game numberOfCardsOf: playerAt2) equals: 2.
]

{ #category : #tests }
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

{ #category : #tests }
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

{ #category : #tests }
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
