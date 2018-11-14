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
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #redo }
Card >> redoOn: aGame by: aPlayer for: anotherCard with: aRedoCard [
	self subclassResponsibility
]

{ #category : #redo }
Card >> redoOn: aGame by: aPlayer to: anotherPlayer with: aRedoCard [
	self subclassResponsibility 
]

{ #category : #redo }
Card >> redoOn: aGame by: aPlayer with: aRedoCard [
	self subclassResponsibility 
]

{ #category : #action }
Card >> thrownOn: aGame by: aPlayer [ 
	self subclassResponsibility
]

{ #category : #action }
Card >> thrownOn: aGame by: aPlayer for: anotherCard [
	self subclassResponsibility 
]

{ #category : #action }
Card >> thrownOn: aGame by: aPlayer to: anotherPlayer [ 
	self subclassResponsibility 
]
