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
		'players',
		'dices',
		'nextPlayerIndex',
		'actualPlayerIndex',
		'state',
		'laps'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Game class >> on: aBoard beeingPlayedBy: players throwing: dices withLaps: anAmountOfLaps [ 
	^ self new initializeOn: aBoard beeingPlayedBy: players throwing: dices withLaps: anAmountOfLaps.
]

{ #category : #accessing }
Game >> actualPlayerIndex [
	nextPlayerIndex <= 1
		ifTrue: [ actualPlayerIndex := players size ]
		ifFalse: [ actualPlayerIndex := nextPlayerIndex - 1 ].
	^ actualPlayerIndex
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
	aPlayer lapsCompleted >= self laps
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
	players sort: #lapsCompleted descending, #position descending.
	
]

{ #category : #update }
Game >> ifTurnOf: aPlayer [
	^ (self players at: self nextPlayerIndex) == aPlayer
]

{ #category : #initialization }
Game >> initializeOn: aBoard beeingPlayedBy: aGroupOfPlayers throwing: aGroupOfDices withLaps: anAmountOfLaps [ 
	board := aBoard.
	players := aGroupOfPlayers.
	dices := aGroupOfDices.
	nextPlayerIndex := 1.
	actualPlayerIndex :=0.
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

{ #category : #effects }
Game >> moonWalkEffect [
	| slotsToMoveBackWards playersToBeMoved |
	slotsToMoveBackWards := ((players at:nextPlayerIndex ) position) // 2.
	playersToBeMoved:= players  select: [ :i | i ~=(players at:nextPlayerIndex) ].
	playersToBeMoved do:[ :each | each moveBackward: slotsToMoveBackWards on: self board ] .
	
]

{ #category : #accessing }
Game >> nextPlayerIndex [
	^ nextPlayerIndex
]

{ #category : #accessing }
Game >> placeOf: aPlayer [
	^ state placeOf: aPlayer in: self.

]

{ #category : #accessing }
Game >> placeWhenGameIsEndedOf: aPlayer [
	^players detectIndex: [:each | each = aPlayer].  
]

{ #category : #accessing }
Game >> placeWhileGameIsBeingPlayedOf: aPlayer [
	| posicion |
	posicion := (1 to: self players size) collect: [ :each | self players at: each ].
	posicion sort: #lapsCompleted descending , #position descending.
	^ posicion detectIndex: [ :each | each = aPlayer ]
]

{ #category : #accessing }
Game >> players [
	^ players
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
	self assertIsTurnOf: aPlayer.
	aPlayer rollDices: self dices on: board.
	(board slots at: aPlayer position) activateEffectOn: self.
	self changeStateAfterTurnOf: aPlayer
]

{ #category : #effects }
Game >> speedUpEffect [
	| slotsToMove |
	slotsToMove :=4.
	(players at: nextPlayerIndex) moveForward: slotsToMove  on: self board
]

{ #category : #effects }
Game >> voidEffect [

]

{ #category : #accessing }
Game >> winner [
	^ state winnerOf: self.
	
]

{ #category : #accessing }
Game >> winnerWhenGameIsEnded [
	^ players at: 1.
]

{ #category : #accessing }
Game >> winnerWhileGameIsBeingPlayed [
	AssertionFailure signal: 'The game is not over.'
]

{ #category : #effects }
Game >> wormHoleEffect [
	| slotsToMove |
	slotsToMove :=4.
	(players at: nextPlayerIndex) moveBackward: slotsToMove  on: self board
]
