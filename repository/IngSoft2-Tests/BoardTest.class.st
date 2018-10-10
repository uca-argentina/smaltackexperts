Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testCreateABoardWithInvalidAmountOfLockers [
|board|
self should: [board:= Board withSlots: 1] raise: AssertionFailure. 


]

{ #category : #tests }
BoardTest >> testCreateBoardWithValidAmountOfLockers [
	| board |
	board := Board withSlots: 20.
	self assert: board numberOfSlots equals: 20.
	
]
