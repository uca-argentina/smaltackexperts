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
		'nextCardIndex',
		'cardsOrdering'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #initialization }
DeterministicDeck class >> withCards: aCardsOrdering [
	^ self new initializeWithCards: aCardsOrdering.
]

{ #category : #accessing }
DeterministicDeck >> cardsOrdering [
	^ cardsOrdering
]

{ #category : #update }
DeterministicDeck >> changeCardIndex [
	self nextCardIndex == self cardsOrdering size
		ifTrue: [
			nextCardIndex := 1. 
			 ]
		ifFalse: [
			nextCardIndex := nextCardIndex + 1. 
			 ]
]

{ #category : #update }
DeterministicDeck >> dealCards [
	| cards |
	cards := OrderedCollection new.
	2 timesRepeat: [ 
		cards add: (cardsOrdering at: nextCardIndex) new.
		self changeCardIndex.
		 ].
	^ cards
]

{ #category : #initialization }
DeterministicDeck >> initializeWithCards: aCardsOrdering [ 
	cardsOrdering := aCardsOrdering.
	nextCardIndex := 1.
]

{ #category : #accessing }
DeterministicDeck >> nextCardIndex [
	^ nextCardIndex
]
