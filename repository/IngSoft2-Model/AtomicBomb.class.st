Class {
	#name : #AtomicBomb,
	#superclass : #Tile,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
AtomicBomb >> activateEffectIn: aGame forPlayer: aPlayer [
	aGame players do: [ :player | aGame changePositionOf: player by: (aGame spaceOf: player) negated + 1 ]
]
