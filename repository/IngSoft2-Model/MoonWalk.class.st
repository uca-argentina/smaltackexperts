Class {
	#name : #MoonWalk,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #action }
MoonWalk >> activateEffectOn: aGame [
	^ aGame moonWalkEffect
]
