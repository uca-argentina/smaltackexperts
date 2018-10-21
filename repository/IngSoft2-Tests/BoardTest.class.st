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
	board := DeterministBoard withSlots: 5.
	atomicBomb := AtomicBomb new.
	wormHole := WormHole new.
	speedUp := SpeedUp new.
	moonWalk := MoonWalk new.
	voidSlot := EmptySlot new.
	board addSpecial: atomicBomb at: 1.
	board addSpecial: wormHole  at:2. 
	board addSpecial: speedUp   at:3.
	board addSpecial: moonWalk   at:4.
	board addSpecial: voidSlot   at:5.
]

{ #category : #tests }
BoardTest >> testCreateBoardWithValidAmountOfLockers [
	| board |
	board := Board withSlots: 20.
	self assert: board numberOfSlots equals: 20.
	
]

{ #category : #tests }
BoardTest >> testCreateDeterministBoardWithValidAmountOfLockers [
	| board |
	board := DeterministBoard withSlots: 20.
	self assert: board numberOfSlots equals: 20.
]
