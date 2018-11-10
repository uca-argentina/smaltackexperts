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
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
PlayerTest >> testPlayerCanBeCreatedWithValidAmountOfCards [
	| jose cards card1 card2 |
	cards := OrderedCollection new.
	card1 := OverloadCard new.
	card2 := RedoCard new.
	cards
		add: card1;
		add: card2.
	jose := Player withName: 'Jose' andCards: cards.
	self
		assert: jose name equals: 'Jose';
		assert: jose cards size equals: 2
]

{ #category : #tests }
PlayerTest >> testPlayerCanNotBeCreatedWithAnInvalidAmountOfCards [
	| jose cards card1 |
	cards := OrderedCollection new.
	card1 := OverloadCard new.
	cards add: card1.
	self should: [ jose := Player withName: 'Jose' andCards: cards ] raise: AssertionFailure.
]
