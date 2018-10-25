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
	#name : #Position,
	#superclass : #Object,
	#instVars : [
		'slot',
		'lapsCompleted'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #update }
Position >> increaseLapsCompletedBy: aNumberOfLaps [
	lapsCompleted := lapsCompleted + aNumberOfLaps.
]

{ #category : #initialization }
Position >> initialize [
	slot := 1.
	lapsCompleted := 0.
]

{ #category : #accessing }
Position >> lapsCompleted [
	^ lapsCompleted.
]

{ #category : #update }
Position >> reduceLapsCompletedBy: aNumberOfLaps [
	lapsCompleted := lapsCompleted - aNumberOfLaps.
]

{ #category : #accessing }
Position >> slot [
	^ slot.
]

{ #category : #update }
Position >> slotChangesBackwardBy: aNumberOfSlots [
	slot := slot - aNumberOfSlots
]

{ #category : #update }
Position >> slotChangesForwardBy: aNumberOfSlots [
	slot := slot + aNumberOfSlots
]

{ #category : #update }
Position >> slotChangesTo: aSlot [
	slot := aSlot.
]
