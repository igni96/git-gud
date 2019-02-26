Class {
	#name : #Tile,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Tile >> activateEffectIn: aGame forPlayer: aPlayer [
	self subclassResponsibility
]
