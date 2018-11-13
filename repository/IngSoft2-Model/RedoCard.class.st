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
	#category : #'IngSoft2-Model'
}

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer for: anotherCard [
	| lastCard |
	lastCard := aGame lastCardPlayed.
	lastCard class = CancellationCard 
	ifFalse: [ AssertionFailure  signal: ' You can only use this message if the last card played was a cancelation card' ].
	lastCard thrownOn: aGame by: aPlayer for: anotherCard.
]

{ #category : #action }
RedoCard >> thrownOn: aGame by: aPlayer to: anotherPlayer [ 
	| lastCard cardClasses |
	lastCard := aGame lastCardPlayed.
	cardClasses := OrderedCollection new.
	cardClasses add: SpeedCard.
	cardClasses add: OverloadCard.
	(cardClasses includes: lastCard class) 
	ifFalse: [ AssertionFailure  signal: ' You can only use this message if the last card played affected another player.' ].
	lastCard thrownOn: aGame by: aPlayer to: anotherPlayer.
]
