Class {
	#name : #Repeat,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Repeat >> activateCardEffectIn: aGame [
	aGame lastTileActivated activateEffectforGame: aGame forPlayer: aGame lastTileActivator
]
