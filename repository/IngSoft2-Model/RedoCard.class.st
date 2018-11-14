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


    Implementation Points
"
Class {
	#name : #RedoCard,
	#superclass : #Card,
	#instVars : [
		'lastCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #action }
RedoCard >> activateEffectOn: aGame to: aPlayer [
	lastCard activateEffectOn: aGame to: aPlayer
]

{ #category : #redo }
RedoCard >> redoOn: aGame by: aPlayer for: anotherCard with: aRedoCard [
	lastCard redoOn: aGame by: aPlayer for: anotherCard with: aRedoCard 
]

{ #category : #redo }
RedoCard >> redoOn: aGame by: aPlayer to: anotherPlayer with: aRedoCard [
	lastCard redoOn: aGame by: aPlayer to: anotherPlayer with: aRedoCard 
]

{ #category : #redo }
RedoCard >> redoOn: aGame by: aPlayer with: aRedoCard [
	lastCard redoOn: aGame by: aPlayer with: aRedoCard 
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer [
	aGame assertIsNotTheFirstCardPlayed.
	lastCard := aGame lastCardPlayed.
	lastCard redoOn: aGame by: aPlayer with: self
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer for: anotherCard [
	aGame assertIsNotTheFirstCardPlayed.
	lastCard := aGame lastCardPlayed.
	lastCard redoOn: aGame by: aPlayer for: anotherCard with: self
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [
	aGame assertIsNotTheFirstCardPlayed.
	lastCard := aGame lastCardPlayed.
	lastCard redoOn: aGame by: aPlayer to: anotherPlayer with: self 
]
