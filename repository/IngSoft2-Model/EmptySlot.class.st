Class {
	#name : #EmptySlot,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
EmptySlot >> activateEffectOn: aGame [
	^ aGame voidEffect
]
