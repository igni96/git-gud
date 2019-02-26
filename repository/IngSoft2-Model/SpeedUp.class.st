Class {
	#name : #SpeedUp,
	#superclass : #Tile,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
SpeedUp >> activateEffectIn: aGame forPlayer: aPlayer [
	aGame changePositionOf: aPlayer by: 4
]
