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
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'lastCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
RedoCard >> activateEffectOn: aGame to: aPlayer [
	lastCard activateEffectOn: aGame to: aPlayer
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer [
	| cardClasses |
	lastCard := aGame lastCardPlayed.
	(Card subclasses includes: aGame lastCardPlayed class)
		ifFalse: [ AssertionFailure signal: 'No card was thrown before.' ].
	cardClasses := OrderedCollection new.
	cardClasses add: AccelerationCard.
	cardClasses add: RepeatCard.
	(cardClasses includes: lastCard class)
		ifFalse: [ AssertionFailure
				signal: ' You can only use this message if the last card played affected another player.' ].
	lastCard class = AccelerationCard
		ifTrue: [ aGame assertIsTurnOf: aPlayer.
				aGame remove: self from: aPlayer.
			aGame players do: [ :each | aGame addToPermanentCards: self for: each ] ]
		ifFalse: [ lastCard activateEffectOn: aGame to: aPlayer ].
	aGame remove: self from: aPlayer
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer for: anotherCard [
	lastCard := aGame lastCardPlayed.
	lastCard class = CancellationCard 
	ifFalse: [ AssertionFailure  signal: ' You can only use this message if the last card played was a cancelation card' ].
	lastCard activateEffectOn: aGame to: anotherCard .
	aGame remove: self from: aPlayer.
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [
	| cardClasses |
	lastCard := aGame lastCardPlayed.
	cardClasses := OrderedCollection new.
	cardClasses add: SpeedCard.
	cardClasses add: OverloadCard.
	(cardClasses includes: lastCard class)
		ifFalse: [ AssertionFailure
				signal: ' You can only use this message if the last card played affected another player.' ].
	aGame assertIsTurnOf: aPlayer.
	aGame remove: self from: aPlayer.
	aGame addToPermanentCards: self for: anotherPlayer.
]
