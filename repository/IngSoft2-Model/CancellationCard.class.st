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
	#name : #CancellationCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
CancellationCard >> activateEffectOn: aGame for: anotherCard [
	aGame assertThereAreActivePermanentCards.
	aGame assertIsActive: anotherCard.
	aGame deactivate: anotherCard
]

{ #category : #redo }
CancellationCard >> redoOn: aGame by: aPlayer for: anotherCard with: aRedoCard [
	self activateEffectOn: aGame for: anotherCard.
	aGame put: aRedoCard intoGameAsInstantBy: aPlayer.
]

{ #category : #redo }
CancellationCard >> redoOn: aGame by: aPlayer to: anotherPlayer with: aRedoCard [
	AssertionFailure signal: 'You don"t have to choose any player.'
]

{ #category : #redo }
CancellationCard >> redoOn: aGame by: aPlayer with: aRedoCard [
	AssertionFailure signal: 'Must choose another card to throw the card.'
]

{ #category : #action }
CancellationCard >> thrownOn: aGame by: aPlayer [ 
	AssertionFailure signal: 'Must choose another card to throw the card.'
]

{ #category : #action }
CancellationCard >> thrownOn: aGame by: aPlayer for: anotherCard [
	self activateEffectOn: aGame for: anotherCard.
	aGame put: self intoGameAsInstantBy: aPlayer.
]

{ #category : #action }
CancellationCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [ 
	AssertionFailure signal: 'You don"t have to choose any player.'
]
