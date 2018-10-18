Class {
	#name : #AtomicBomb,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
AtomicBomb >> activateEffect: aGame [
	^ aGame atomicBombEffect.
]
