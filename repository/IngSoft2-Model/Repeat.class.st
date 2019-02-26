Class {
	#name : #Repeat,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Repeat >> activateCardEffectIn: aGame [
	aGame lastTileActivated activateEffectIn: aGame forPlayer: aGame lastTileActivator
]
