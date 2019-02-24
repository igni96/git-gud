Class {
	#name : #Cancellation,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Cancellation >> activateCardEffectForCard: aCard in: aGame [
	aGame players do: [ :player | aGame removePermanentCard: aCard from: player ]
]
