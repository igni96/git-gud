Class {
	#name : #DrawACard,
	#superclass : #Tile,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
DrawACard >> activateEffectIn: aGame forPlayer: aPlayer [
	aGame drawCardForPlayer: aPlayer
]
