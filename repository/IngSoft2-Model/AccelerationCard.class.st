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
	#name : #AccelerationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
AccelerationCard >> activateEffectOn: aGame to: aPlayer [ 
	aGame move: aPlayer forward: 1. 
]

{ #category : #redo }
AccelerationCard >> redoOn: aGame by: aPlayer for: anotherCard with: aRedoCard [
	AssertionFailure signal: 'You don"t have to choose any card.'
]

{ #category : #redo }
AccelerationCard >> redoOn: aGame by: aPlayer to: anotherPlayer with: aRedoCard [
	AssertionFailure signal: 'You don"t have to choose any player.'
]

{ #category : #redo }
AccelerationCard >> redoOn: aGame by: aPlayer with: aRedoCard [
	aGame playPermanentCard: aRedoCard of: aPlayer.
	aGame players do: [ :each | aGame addToPermanentCards: aRedoCard for: each ]
]

{ #category : #action }
AccelerationCard >> thrownOn: aGame by: aPlayer [
	aGame playPermanentCard: self of: aPlayer.
	aGame players do: [ :each | aGame addToPermanentCards: self for: each ]
]

{ #category : #action }
AccelerationCard >> thrownOn: aGame by: aPlayer for: anotherCard [
	AssertionFailure signal: 'You don"t have to choose any card.'
]

{ #category : #action }
AccelerationCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [ 
	AssertionFailure signal: 'You don"t have to choose any player.'
]
