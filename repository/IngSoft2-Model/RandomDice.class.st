Class {
	#name : #RandomDice,
	#superclass : #Object,
	#instVars : [
		'numberOfFaces'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
RandomDice class >> withFaces: anAmountOfFaces [
anAmountOfFaces>1
	ifTrue: [ ^ self new initializeWithFaces: anAmountOfFaces ]
		ifFalse: [ AssertionFailure
				signal: 'you can''t create a dice with less than 2 faces' ]
]

{ #category : #initialization }
RandomDice >> initializeWithFaces: anAmountOfFaces [
numberOfFaces:= anAmountOfFaces.
]

{ #category : #accessing }
RandomDice >> numberOfFaces [
^numberOfFaces.
]

{ #category : #actions }
RandomDice >> rollDice [

	^((1 to: numberOfFaces) atRandom).

]
