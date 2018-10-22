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
	lockers:		<Object>


    Implementation Points
"
Class {
	#name : #RandomBoard,
	#superclass : #Object,
	#instVars : [
		'slots'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialize }
RandomBoard class >> withSlots: anAmountOfSlots [
	anAmountOfSlots  >1
	ifTrue:[
	^ self new initializeWithSlots: anAmountOfSlots .]
ifFalse:[
	AssertionFailure signal: 'Board size must be greater than 1']
]

{ #category : #adding }
RandomBoard >> addNewSlot [
	| value |
	value := (1 to: 100) atRandom.
	value <= 48
		ifTrue: [ 
			slots add: EmptySlot new.
			 ]
		ifFalse: [ 
			value <= 68
				ifTrue: [ 
					slots add: WormHole new.
					 ]
				ifFalse: [ 
					value <= 88
						ifTrue: [ 
							slots add: SpeedUp new.
							 ]
						ifFalse: [ 
							value <= 98
								ifTrue: [ 
									slots add: MoonWalk new.
									 ]
								ifFalse: [ 
									slots add: AtomicBomb new.
									 ]
							 ]
					 ]
			 ]
]

{ #category : #initialization }
RandomBoard >> initializeWithSlots: anAmountOfSlots [
	slots := OrderedCollection new: anAmountOfSlots.
	anAmountOfSlots timesRepeat: [ self addNewSlot ].
	slots := slots asArray.
	
]

{ #category : #accessing }
RandomBoard >> numberOfSlots [
	^ slots size . 
]

{ #category : #accesing }
RandomBoard >> slots [
	^ slots
]
