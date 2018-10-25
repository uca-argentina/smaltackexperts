Class {
	#name : #PositionTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PositionTest >> testPositionCreation [
	| position |
	position := Position new.
	self assert: position slot equals: 1;
			assert: position lapsCompleted equals: 0.
]
