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
Game >> board [
	^ board
]

{ #category : #update }
Game >> changeTurn [
	self nextPlayer == self players size
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
	players
		sort: [ :player1 :player2 | player1 position >= player2 position ]
]

{ #category : #update }
Game >> ifTurnOf: aPlayer [
	^ (self players at: self nextPlayer) == aPlayer
]

{ #category : #initialization }
Game >> initializeOn: aBoard beeingPlayedBy: aGroupOfPlayers throwing: aGroupOfDices withLaps: anAmountOfLaps [ 
	board := aBoard.
	players := aGroupOfPlayers.
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

{ #category : #accessing }
Game >> nextPlayer [
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
	AssertionFailure signal: 'Game is not ended.'.
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
	AssertionFailure signal: 'The game is not over.'
]

{ #category : #update }
Game >> playsWhileGameIsBeingPlayed: aPlayer [
	(self ifTurnOf: aPlayer)
		ifTrue: [ aPlayer rollDices: self dices.
			aPlayer position >= self board numberOfSlots
				ifTrue:
					[ self endGame ]
				ifFalse: [ self changeTurn ] ]
		ifFalse: [ AssertionFailure signal: 'Not this player"s turn.' ]
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
