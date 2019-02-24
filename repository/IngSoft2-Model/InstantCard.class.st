Class {
	#name : #InstantCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
InstantCard >> isPlayableBy: aPlayer in: aGame [
	(aGame handOf: aPlayer) detect: [ :card | card = self ] ifNone: [ AssertionFailure signal: 'The player does not possess a card' ].
]
