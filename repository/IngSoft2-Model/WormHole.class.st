Class {
	#name : #WormHole,
	#superclass : #Tile,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
WormHole >> activateEffectIn: aGame forPlayer: aPlayer [
	aGame changePositionOf: aPlayer by: 4 negated
]
