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
	board:		<Object>
	dices:		<Object>
	nextPlayerIndex:		<Object>
	players:		<Object>
	state:		<Object>


    Implementation Points
"
Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'board',
		'positions',
		'dices',
		'nextPlayerIndex',
		'state',
		'laps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> on: aBoard beeingPlayedBy: players throwing: dices withLaps: anAmountOfLaps [ 
	^ self new initializeOn: aBoard beeingPlayedBy: players throwing: dices withLaps: anAmountOfLaps.
]

{ #category : #update }
Game >> assertIsTurnOf: aPlayer [
	(self ifTurnOf: aPlayer)
		ifFalse: [ AssertionFailure signal: 'Not this player"s turn.' ]
]

{ #category : #accessing }
Game >> board [
	^ board
]

{ #category : #update }
Game >> changeStateAfterTurnOf: aPlayer [
	(self lapsCompletedOf: aPlayer) >= self laps
		ifTrue: [ self endGame ]
		ifFalse: [ self changeTurn ]
]

{ #category : #update }
Game >> changeTurn [
	self nextPlayerIndex == self players size
		ifTrue: [
			nextPlayerIndex := 1. 
			 ]
		ifFalse: [
			nextPlayerIndex := nextPlayerIndex + 1. 
			 ]
]

{ #category : #accessing }
Game >> dices [
	^ dices
]

{ #category : #update }
Game >> endGame [
	state := GameEnded new.
	
]

{ #category : #update }
Game >> ifTurnOf: aPlayer [
	^ (self players at: self nextPlayerIndex) == aPlayer
]

{ #category : #initialization }
Game >> initializeOn: aBoard beeingPlayedBy: aGroupOfPlayers throwing: aGroupOfDices withLaps: anAmountOfLaps [ 
	positions := Dictionary new.
	board := aBoard.
	aGroupOfPlayers do: [ :each | positions add: (each -> Position new) ].
	dices := aGroupOfDices.
	nextPlayerIndex := 1.
	state := GamePlaying new.
	laps := anAmountOfLaps.
	
]

{ #category : #accessing }
Game >> isOver [
	^ state isOver.
]

{ #category : #accessing }
Game >> laps [
	^ laps
]

{ #category : #update }
Game >> lapsCompletedOf: aPlayer [
	^ (positions at: aPlayer) lapsCompleted.
]

{ #category : #update }
Game >> move: aPlayer backward: aNumberOfSlots [
	| position actualSlot actualLap |
	position := positions at: aPlayer.
	actualSlot := position slot.
	actualLap := position lapsCompleted.
	actualSlot := actualSlot - aNumberOfSlots.
	actualSlot > 0
		ifFalse: [ 
			actualLap := actualLap - 1.
			actualSlot := actualSlot + board numberOfSlots.
			 ].
	positions at: aPlayer put: (Position on: actualSlot andWith: actualLap).
]

{ #category : #update }
Game >> move: aPlayer forward: aNumberOfSlots [
	| position actualSlot actualLap |
	position := positions at: aPlayer.
	actualSlot := position slot.
	actualLap := position lapsCompleted.
	actualSlot := actualSlot + aNumberOfSlots.
	actualSlot >= board numberOfSlots
		ifTrue: [ 
			actualLap := actualLap + actualSlot // board numberOfSlots.
			actualSlot > board numberOfSlots
				ifTrue: [
					actualSlot := actualSlot rem: board numberOfSlots.  
					 ]
			 ].
	positions at: aPlayer put: (Position on: actualSlot andWith: actualLap). 
]

{ #category : #accessing }
Game >> nextPlayerIndex [
	^ nextPlayerIndex
]

{ #category : #accessing }
Game >> nextPlayerIndex: anObject [
	nextPlayerIndex := anObject
]

{ #category : #accessing }
Game >> placeOf: aPlayer [
	| actualPositions |
	actualPositions := self sortPlayersByPosition.
	^ actualPositions detectIndex: [ :each | each = aPlayer ]
]

{ #category : #accessing }
Game >> players [
	^ positions keysSortedSafely.
]

{ #category : #update }
Game >> plays: aPlayer [
	state plays: aPlayer in: self.

]

{ #category : #update }
Game >> playsWhenGameIsEnded: aPlayer [
	AssertionFailure signal: 'The game is over.'
]

{ #category : #update }
Game >> playsWhileGameIsBeingPlayed: aPlayer [
	| slot |
	self assertIsTurnOf: aPlayer.
	self rollDicesFor: aPlayer.
	slot := (positions at: aPlayer) slot.
	(board slots at: slot) activateEffectOn: self.
	self changeStateAfterTurnOf: aPlayer
]

{ #category : #accessing }
Game >> positions [
	^ positions
]

{ #category : #update }
Game >> rollDicesFor: aPlayer [
	self move: aPlayer forward: (dices sumNumbers: [ :each | each rollDice ]).
]

{ #category : #accessing }
Game >> slotOf: aPlayer [
	^ (positions at: aPlayer) slot.
]

{ #category : #accessing }
Game >> sortPlayersByPosition [
	^ self players
		asSortedCollection:
			[ :player | self lapsCompletedOf: player ] descending
				, [ :player | self slotOf: player ] descending
]

{ #category : #accessing }
Game >> winner [
	^ state winnerOf: self.
	
]

{ #category : #accessing }
Game >> winnerWhenGameIsEnded [
	| actualPositions |
	actualPositions := self sortPlayersByPosition.
	^ actualPositions at: 1.
]

{ #category : #accessing }
Game >> winnerWhileGameIsBeingPlayed [
	AssertionFailure signal: 'The game is not over.'
]
