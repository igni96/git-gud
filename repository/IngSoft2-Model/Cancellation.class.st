Class {
	#name : #Cancellation,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Cancellation >> activateCardEffectForCard: aCard in: aGame [
	aGame activePermanentCards 
		detect: [ :cardsOfPlayer | cardsOfPlayer includes: aCard ]
		ifNone: [ AssertionFailure signal: 'Cancellation requires an active permanent card to cancel' ].
	aGame players do: [ :player | aGame removePermanentCard: aCard from: player ]
]
