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

    Instance Variables
	name:		<Object>
	position:		<Object>


    Implementation Points
"
Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'position',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Player class >> withName: aName [
	^ self new initializeWithName: aName.
]

{ #category : #initialization }
Player >> initializeWithName: aName [
	name:= aName.
	position := 0.
	lap := 1.
]

{ #category : #accessing }
Player >> lap [
	^ lap.
]

{ #category : #update }
Player >> moveForward: aNumberOfSlots on: aBoard [
	position := position + aNumberOfSlots.
	position > aBoard numberOfSlots
		ifTrue: [ 
			lap := lap + 1.
			position := position rem: (aBoard numberOfSlots).
			 ]
]

{ #category : #accessing }
Player >> name [
	^ name.
]

{ #category : #accessing }
Player >> position [
	^ position.
]

{ #category : #update }
Player >> rollDices: dices on: aBoard [
	self
		moveForward: (dices sumNumbers: [ :each | each rollDice ])
		on: aBoard
]
