"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #DeterministicDeck,
	#superclass : #Object,
	#instVars : [
		'cardsOrdering'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
DeterministicDeck class >> withCards: aCardsOrdering [
	^ self new initializeWithCards: aCardsOrdering.
]

{ #category : #update }
DeterministicDeck >> addFromDiscarDeck: aCollection [
	cardsOrdering addAll: aCollection
]

{ #category : #creation }
DeterministicDeck >> addRandomCard [
	cardsOrdering add: (self cardFromNumber: 6 atRandom)
]

{ #category : #creation }
DeterministicDeck >> addRandomCards: anAmountOfCards [
	anAmountOfCards timesRepeat: [ self addRandomCard ]

]

{ #category : #creation }
DeterministicDeck >> cardFromNumber: aNumber [
	aNumber <= 1
		ifTrue: [ ^ AccelerationCard new].
	aNumber <= 2
		ifTrue: [ ^ CancellationCard  new].
	aNumber <= 3
		ifTrue: [ ^ OverloadCard new ].
	aNumber <= 4
		ifTrue: [ ^ RedoCard new ].
	aNumber <= 5
		ifTrue: [ ^ RepeatCard new ].
	^ SpeedCard new.
]

{ #category : #update }
DeterministicDeck >> dealCards: anAmountOfCards [
	^ ((1 to: anAmountOfCards) collect: [ :n | self dealOneCard ]) asOrderedCollection
]

{ #category : #update }
DeterministicDeck >> dealOneCard [
	| card |
	cardsOrdering isEmpty
		ifTrue: [ self addCardsFromDiscardDeck ].
	card := cardsOrdering at: 1.
	cardsOrdering remove: card.
	^ card


	"nextCardIndex <= cardsOrdering size
		ifTrue: [ card := cardsOrdering at: nextCardIndex.
			self changeCardIndex.
			^ card ]"
]

{ #category : #accessing }
DeterministicDeck >> deckOfCards [
	^ cardsOrdering
]

{ #category : #initialization }
DeterministicDeck >> initialize [
	cardsOrdering := OrderedCollection new.
	
]

{ #category : #initialization }
DeterministicDeck >> initializeWithCards: aCardsOrdering [
	cardsOrdering := aCardsOrdering.

]
