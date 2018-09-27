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
	numberOfFaces:		<Object>


    Implementation Points
"
Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'numberOfFaces',
		'type',
		'deterministicValues',
		'nextIndexOfDeterministicValue'
	],
	#classInstVars : [
		'numberOfFaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialize }
Dice class >> with: anInteger facesAndType: aType. [
	anInteger  > 1
		ifTrue: [ ^ self new initializeWith: anInteger facesAndType: aType.  ]
		ifFalse: [ AssertionFailure signal: 'you can''t create a dice with less than 2 faces' ]
]

{ #category : #initialization }
Dice >> initializeWith: anInteger facesAndType: aType [
		numberOfFaces := anInteger.
		type := aType.
		deterministicValues := OrderedCollection new.
		numberOfFaces to: 1 by: -1 do: [:i | deterministicValues add: i ].
		nextIndexOfDeterministicValue := numberOfFaces.
]

{ #category : #accessing }
Dice >> numberOfFaces [
 ^numberOfFaces .
]

{ #category : #'as yet unclassified' }
Dice >> rollDeterministicDice [
	| value |
	nextIndexOfDeterministicValue < numberOfFaces
		ifTrue: [ nextIndexOfDeterministicValue := nextIndexOfDeterministicValue + 1 ]
		ifFalse: [ nextIndexOfDeterministicValue := 1 ].
	value := deterministicValues at: nextIndexOfDeterministicValue.
	^ value.
]

{ #category : #'as yet unclassified' }
Dice >> rollDice [
	|number|
	"number:= (1 to:numberOfFaces ) atRandom.
	^number ."
	number:= (type  rollDice: self ). 
	^number .
]

{ #category : #'as yet unclassified' }
Dice >> rollRandomDice [
	|number|
	number:= (1 to:numberOfFaces ) atRandom.
	^ number.
]
