Class {
	#name : #Overload,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Overload >> activateCardEffectForPlayer: aPlayer in: aGame [
	aGame addPermanentCard: self to: aPlayer
]

{ #category : #actions }
Overload >> tilesToMove [
	^ (-2)
]
