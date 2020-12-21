"
Implementation of discard deck
"
Class {
	#name : #DiscardDeck,
	#superclass : #Object,
	#instVars : [
		'discardDeck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
DiscardDeck >> addToDiscardDeck: aCard [
	self discardDeck  add: aCard
]

{ #category : #accesing }
DiscardDeck >> discardDeck [ 
^discardDeck 
]

{ #category : #accessing }
DiscardDeck >> emptyDiscardDeck [
	discardDeck removeAll
]

{ #category : #initialization }
DiscardDeck >> initialize [
	 discardDeck:= OrderedCollection new.
]

{ #category : #accesing }
DiscardDeck >> shuffleDiscardDeck [
^(discardDeck shuffled )
]
