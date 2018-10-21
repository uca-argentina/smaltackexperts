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
	#name : #DeterministBoard,
	#superclass : #Object,
	#instVars : [
		'slots'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #initialize }
DeterministBoard class >> withSlots: anAmountOfSlots [
	anAmountOfSlots  >1
	ifTrue:[
	^ self new initializeWithSlots: anAmountOfSlots .]
ifFalse:[
	AssertionFailure signal: 'Board size must be greater than 1']
]

{ #category : #adding }
DeterministBoard >> addSpecial: effect at: anIndex [
	self slots at: anIndex put: effect.
]

{ #category : #initialization }
DeterministBoard >> initializeWithSlots: anAmountOfSlots [
	slots := OrderedCollection new: anAmountOfSlots.
	slots add: (EmptySlot new) withOccurrences: anAmountOfSlots.
	slots := slots asArray.
]

{ #category : #accessing }
DeterministBoard >> numberOfSlots [
	^ slots size .
]

{ #category : #accessing }
DeterministBoard >> slots [
	^ slots
]
