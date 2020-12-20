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
	#name : #OverloadCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
OverloadCard >> activateEffectOn: aGame to: aPlayer [ 
	aGame move: aPlayer backward: 2. 
	
]

{ #category : #redo }
OverloadCard >> redoOn: aGame by: aPlayer for: anotherCard with: aRedoCard [
	AssertionFailure signal: 'Must choose a player to throw the card, not another card.'
]

{ #category : #redo }
OverloadCard >> redoOn: aGame by: aPlayer to: anotherPlayer with: aRedoCard [
	aGame playPermanentCard: aRedoCard of: aPlayer.
	aGame addToPermanentCards: aRedoCard for: anotherPlayer
]

{ #category : #redo }
OverloadCard >> redoOn: aGame by: aPlayer with: aRedoCard [
	AssertionFailure signal: 'Must choose a player to throw the card.'
]

{ #category : #action }
OverloadCard >> thrownOn: aGame by: aPlayer [ 
	AssertionFailure signal: 'Must choose a player to throw the card.'
]

{ #category : #action }
OverloadCard >> thrownOn: aGame by: aPlayer for: anotherCard [ 
	AssertionFailure signal: 'Must choose a player to throw the card, not another card.'
]

{ #category : #action }
OverloadCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [
	aGame playPermanentCard: self of: aPlayer.
	aGame addToPermanentCards: self for: anotherPlayer
]
