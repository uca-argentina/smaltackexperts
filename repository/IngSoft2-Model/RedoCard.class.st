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
	lastCard := aGame lastCardPlayed.
	aGame assertIsNotTheFirstCardPlayed.
	self assert: lastCard belongsTo: self cardClassesWithNoTarget.
	lastCard class = AccelerationCard
		ifTrue: [ aGame put: self intoGameBy: aPlayer.
			aGame players do: [ :each | aGame addToPermanentCards: self for: each ] ]
		ifFalse: [ lastCard activateEffectOn: aGame to: aPlayer.
			aGame remove: self from: aPlayer
			 ].
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer for: anotherCard [
	lastCard := aGame lastCardPlayed.
	aGame assertIsNotTheFirstCardPlayed.
	self assert: lastCard belongsTo: self cardClassesAffectingAnotherCard.
	lastCard activateEffectOn: aGame to: anotherCard.
	aGame remove: self from: aPlayer
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [
	aGame assertIsNotTheFirstCardPlayed.
	lastCard := aGame lastCardPlayed.
	self assert: lastCard belongsTo: self cardClassesAffectingPlayers.
	aGame put: self intoGameBy: aPlayer.
	aGame addToPermanentCards: self for: anotherPlayer
]
