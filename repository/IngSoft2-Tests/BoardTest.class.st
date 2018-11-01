Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> testCreateABoardWithInvalidAmountOfLockers [
|board|
self should: [board:= RandomBoard withSlots: 1] raise: AssertionFailure. 


]

{ #category : #tests }
BoardTest >> testCreateBoardWithValidAmountOfLockers [
	| board |
	board := RandomBoard withSlots: 20.
	self assert: board numberOfSlots equals: 20.
	
]

{ #category : #tests }
BoardTest >> testCreateDeterministicBoardWithSpecialSlots [
	| board atomicBomb wormHole speedUp voidSlot moonWalk |
	board := DeterministicBoard withSlots: 5.
	atomicBomb := AtomicBomb new.
	wormHole := WormHole new.
	speedUp := SpeedUp new.
	moonWalk := MoonWalk new.
	voidSlot := EmptySlot new.
	board addSpecial: atomicBomb at: 1.
	board addSpecial: wormHole at: 2.
	board addSpecial: speedUp at: 3.
	board addSpecial: moonWalk at: 4.
	board addSpecial: voidSlot at: 5.
	self
		assert: (board slots at: 1) equals: atomicBomb;
		assert: (board slots at: 2) equals: wormHole;
		assert: (board slots at: 3) equals: speedUp;
		assert: (board slots at: 4) equals: moonWalk;
		assert: (board slots at: 5) equals: voidSlot
]

{ #category : #tests }
BoardTest >> testCreateDeterministicBoardWithValidAmountOfLockers [
	| board |
	board := DeterministicBoard withSlots: 20.
	self assert: board numberOfSlots equals: 20.
]

{ #category : #tests }
BoardTest >> testCreateRandomBoardWithValidSlots [
	| board slotsClasses |
	board := RandomBoard withSlots: 20.
	slotsClasses := OrderedCollection new.
	slotsClasses add: EmptySlot.
	slotsClasses add: MoonWalk.
	slotsClasses add: AtomicBomb.
	slotsClasses add: SpeedUp.
	slotsClasses add: WormHole.
	self assert: (board slots allSatisfy: [ :slot | slotsClasses includes: slot class]).
]
