Class {
	#name : #Repeat,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Repeat >> activateCardEffectFor: aPlayer in: aGame [
	aGame lastTileActivated activateEffectforGame: aGame forPlayer: aGame lastTileActivator
]
