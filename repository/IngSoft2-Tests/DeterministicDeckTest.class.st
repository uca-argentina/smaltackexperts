Class {
	#name : #DeterministicDeckTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #'creation-boards' }
DeterministicDeckTest >> boardWith20SlotsAndAllEffects [
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
DeterministicDeckTest >> boardWith20SlotsAndCardSlot [
	| board cardSlot |
	board := DeterministicBoard withSlots: 20.
	cardSlot := CardSlot new.
	board addSpecial: cardSlot at: 3.
	board addSpecial: cardSlot at: 4.
	board addSpecial: cardSlot at: 5.
	board addSpecial: cardSlot at: 7.
	board addSpecial: cardSlot at: 8.
	board addSpecial: cardSlot at: 10.
	board addSpecial: cardSlot at: 13.
	board addSpecial: cardSlot at: 16.
	board addSpecial: cardSlot at: 18.
	^ board
]

{ #category : #'creation-games' }
DeterministicDeckTest >> gameWith2playerAnd1DiceIndeterministicBoard [
	| game board juan hernan dice1 dice2 players dices deckOfCards cards |
	board := self boardWith20SlotsAndCardSlot.
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(3 5 2 4 1 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices
		add: dice1.
	cards := OrderedCollection new.
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
DeterministicDeckTest >> gameWith2playerAnd1DiceIndeterministicBoardwithCardSlot [
	| game board juan hernan dice1 players dices deckOfCards cards |
	board := self boardWith20SlotsAndCardSlot .
	juan := 'Juan'.
	hernan := 'Hernan'.
	dice1 := DeterministicDice withFaces: 6 andValues: #(2 4 5 6 1 3).
	players := OrderedCollection new.
	players
		add: juan;
		add: hernan.
	dices := OrderedCollection new.
	dices add: dice1.
	cards := OrderedCollection new.
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
DeterministicDeckTest >> testAddingCardsFromDiscardDeck [
	| deck |
	deck := DeterministicDeck new.
	deck addRandomCards: 4.
	self assert: deck deckOfCards size equals: 4
]

{ #category : #'test-cards' }
DeterministicDeckTest >> testAddingCardsToDeterministicDeck [
	| cardsClasses deck discardDeck card1 card2 |
	cardsClasses := OrderedCollection new.
	cardsClasses add: RedoCard new.
	cardsClasses add: RepeatCard new.
	cardsClasses add: AccelerationCard new.
	cardsClasses add: CancellationCard new.
	deck := DeterministicDeck withCards: cardsClasses.
	self assert: deck deckOfCards size equals: 4.
	discardDeck := DiscardDeck new.
	card1 := AccelerationCard new.
	card2 := OverloadCard new.
	discardDeck addToDiscardDeck: card1.
	discardDeck addToDiscardDeck: card2.
	deck addFromDiscarDeck: discardDeck discardDeck.
	self assert: deck deckOfCards size equals: 6
]

{ #category : #'test-cards' }
DeterministicDeckTest >> testAddingRandomCardsToDeck [
	| deck anAmountOfCards |
	deck := DeterministicDeck new.
	anAmountOfCards := 20.
	deck addRandomCards: anAmountOfCards.	
	self assert: deck deckOfCards size equals: 20
]

{ #category : #'test-cards' }
DeterministicDeckTest >> testMovingCardsFromDiscardDeckToDeck [
	| game playerAt1 playerAt2 cancelattioncCard card1 card2 card3 |
	game := self gameWith2playerAnd1DiceIndeterministicBoardwithCardSlot.
	playerAt1 := game players at: 1.
	playerAt2 := game players at: 2.
	card3 := (game cardsOf: playerAt1) at: 1.
	card2 := (game cardsOf: playerAt1) at: 2.
	cancelattioncCard := (game cardsOf: playerAt2) at: 2.
	card1 := (game cardsOf: playerAt2) at: 1.
	self assert: cancelattioncCard class equals: CancellationCard.
	self assert: card1 class equals: AccelerationCard.
	self assert: card3 class equals: OverloadCard.
	self assert: card2 class equals: SpeedCard.
	game plays: playerAt1 throwing: card3 to: playerAt2.
	self
		should: [ game plays: playerAt2 throwing: cancelattioncCard ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'Must choose another card to throw the card.' ].
	self
		should: [ game plays: playerAt2 throwing: cancelattioncCard to: playerAt1 ]
		raise: AssertionFailure
		withExceptionDo: [ :signal | 
			self
				assert: signal messageText
				equals: 'You don"t have to choose any player.' ].
	game plays: playerAt2 throwing: cancelattioncCard for: card3.
	game plays: playerAt1.
	self assert: game discardDeck size equals: 2.
	self assert: game deckOfCards size equals: 1.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 1.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 1.
	self assert: ((game cardsOf: playerAt1) at: 2) class equals: RedoCard.
	game plays: playerAt2.
	self assert: (game slotOf: playerAt1) equals: 3.
	self assert: (game lapsCompletedOf: playerAt1) equals: 0.
	self assert: (game slotOf: playerAt2) equals: 5.
	self assert: game deckOfCards size equals: 0.
	self assert: game discardDeck size equals: 2.
	self assert: (game lapsCompletedOf: playerAt2) equals: 0.
	self assert: (game cardsOf: playerAt1) size equals: 2.
	self assert: (game cardsOf: playerAt2) size equals: 2.
	game plays: playerAt1.
	self assert: (game slotOf: playerAt1) equals: 8.
	self assert: game discardDeck size equals: 0.
	self assert: game deckOfCards size equals: 1
]

{ #category : #'test-cards' }
DeterministicDeckTest >> testShuffledDeck [
	| deckOfCards cards deck |
	"this test was created to see how shuffled works. It may not pass."
	cards := OrderedCollection new.
	cards add: AccelerationCard new.
	cards add: CancellationCard new.
	cards add: OverloadCard new.
	cards add: SpeedCard new.
	cards add: RedoCard new.
	cards add: RepeatCard new.
	deckOfCards := DeterministicDeck withCards: cards.
	self assert: deckOfCards deckOfCards size equals: 6.
	self
		assert: (deckOfCards deckOfCards at: 1) class
		equals: AccelerationCard.
	deck := deckOfCards deckOfCards.
	self assert: (deck at: 1) class equals: AccelerationCard.
	deck := deck shuffled.
	"self assert: (deck at: 1) class equals: AccelerationCard"
]
