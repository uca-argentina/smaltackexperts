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
		'position'
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
]

{ #category : #update }
Player >> moveForward: aNumberOfLockers [ 
	position := position + aNumberOfLockers.
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
Player >> rollDices: Dices [ 
	| sum |
	sum := 0. 
	"anArrayOfDices sum: #rollDice.  
	Dices do: [ :each | sum:= sum + each rollDice].
	inject:into:
	sum: #rollDice"
	sum := Dices sumNumbers: [ :each | each rollDice ].
	self moveForward: sum
]

{ #category : #update }
Player >> rollDicesWith: aNumber [
"dados deterministico"

	self moveForward: aNumber.
]
