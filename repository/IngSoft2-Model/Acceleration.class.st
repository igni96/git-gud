Class {
	#name : #Acceleration,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Acceleration >> activateCardEffectIn: aGame [
	aGame players do: [ :player | aGame addPermanentCard: self to: player ]
]

{ #category : #actions }
Acceleration >> tilesToMove [
	^ 1.
]
