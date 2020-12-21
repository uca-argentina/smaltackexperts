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
	#name : #RepeatCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
RepeatCard >> activateEffectOn: aGame [
	aGame repeatLastSlotEffect
]

{ #category : #redo }
RepeatCard >> redoOn: aGame by: aPlayer for: anotherCard with: aRedoCard [
	AssertionFailure signal: 'You don"t have to choose any card.'
]

{ #category : #redo }
RepeatCard >> redoOn: aGame by: aPlayer to: anotherPlayer with: aRedoCard [
	AssertionFailure signal: 'You don"t have to choose any player.'
]

{ #category : #redo }
RepeatCard >> redoOn: aGame by: aPlayer with: aRedoCard [
	self activateEffectOn: aGame.
	aGame playInstantCard: aRedoCard of: aPlayer
]

{ #category : #action }
RepeatCard >> thrownOn: aGame by: aPlayer [
	self activateEffectOn: aGame.
	aGame playInstantCard: self of: aPlayer
]

{ #category : #action }
RepeatCard >> thrownOn: aGame by: aPlayer for: anotherCard [ 
	AssertionFailure signal: 'You don"t have to choose any card.'
]

{ #category : #action }
RepeatCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [ 
	AssertionFailure signal: 'You don"t have to choose any player.'
]
