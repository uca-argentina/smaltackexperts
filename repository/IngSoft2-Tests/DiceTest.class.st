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
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testCreateADiceWithInvalidFaces [
	| dice |
	self should: [ dice := DeterministicDice withFaces: 1 ] raise: AssertionFailure
]

{ #category : #tests }
DiceTest >> testCreateADicewithAValidNumberOfFaces [
	| dice  |

	dice := DeterministicDice withFaces: 6.
	self assert: dice numberOfFaces = 6
]

{ #category : #tests }
DiceTest >> testRollDeterministicDice [
	| dice |
	dice := DeterministicDice withFaces: 8.
	self assert: dice rollDice equals: 8
]

{ #category : #tests }
DiceTest >> testRollRandomDice [
| dice|
dice:= RandomDice withFaces: 6.
self assert: (dice rollDice between: 1 and: 6).

]
