Class {
	#name : #PositionTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PositionTest >> testPositionCreation [
	| position |
	position := Position on:1  andWith: 0. 
	self assert: position slot equals: 1;
			assert: position lapsCompleted equals: 0.
]

{ #category : #tests }
PositionTest >> testPositionCreationWithASlotAndANumberOfLaps [
	| position slot lapsCompleted |
	slot := 5.
	lapsCompleted := 2.
	position := Position on: slot andWith: lapsCompleted.
	self
		assert: position slot equals: 5;
		assert: position lapsCompleted equals: 2
]
