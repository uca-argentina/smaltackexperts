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
	#name : #SpeedCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
SpeedCard >> activateEffectOn: aGame to: aPlayer [ 
	aGame move: aPlayer forward: 1. 
]

{ #category : #action }
SpeedCard >> thrownOn: aGame by: aPlayer [
	AssertionFailure signal: 'Must choose a player to throw the card.'
]

{ #category : #action }
SpeedCard >> thrownOn: aGame by: aPlayer for: anotherCard [ 
	AssertionFailure signal: 'Must choose a player to throw the card, not another card.'
]

{ #category : #action }
SpeedCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [ 
	aGame remove: self from: aPlayer.
	aGame addToPermanentCards: self for: anotherPlayer.
]
