Class {
	#name : #AtomicBomb,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
AtomicBomb >> activateEffectOn: aGame [
	^ aGame atomicBombEffect
]
