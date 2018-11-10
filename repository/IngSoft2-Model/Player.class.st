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
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Player class >> withName: aName andCards: aSetOfCards [
	aSetOfCards size = 2
		ifTrue: [ ^ self new initializeWithName: aName andCards: aSetOfCards ]
		ifFalse:
			[ AssertionFailure signal: 'A player must have two cards at the beginning of the game.' ]
]

{ #category : #accessing }
Player >> cards [
	^ cards.
]

{ #category : #initialization }
Player >> initializeWithName: aName andCards: aSetOfCards [
	name := aName.
	cards := aSetOfCards
]

{ #category : #accessing }
Player >> name [
	^ name.
]

{ #category : #accessing }
Player >> numberOfCards [
	^ cards size.
]
