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
BoardTest >> testCreateBoardWIthSpecialSlots [
	| board atomicBomb wormHole speedUp voidSlot moonWalk |
	board := Board withSlots: 5.
	atomicBomb := AtomicBomb new.
	wormHole := WormHole new.
	speedUp := SpeedUp new.
	moonWalk := MoonWalk new.
	voidSlot := VoidSlot new.
	(board slots at: 1) = atomicBomb.
	(board slots at: 2) = wormHole.
	(board slots at: 3) = speedUp.
	(board slots at: 4) = moonWalk.
	(board slots at: 5) = voidSlot.
]

{ #category : #tests }
BoardTest >> testCreateBoardWithValidAmountOfLockers [
	| board |
	board := Board withSlots: 20.
	self assert: board numberOfSlots equals: 20.
	
]
