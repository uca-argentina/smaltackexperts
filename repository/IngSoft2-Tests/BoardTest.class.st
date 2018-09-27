Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testCreateABoardWith1Lock [
|board|
self should: [board:= Board withNumberOfLockers: 1] raise: AssertionFailure. 


]

{ #category : #tests }
BoardTest >> testCreateBoardWith20lockers [
	| board |
	board := Board withNumberOfLockers: 20.
	self assert: board numberOfLockers equals: 20.
	
]
