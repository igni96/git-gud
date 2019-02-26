Class {
	#name : #PermanentCard,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
PermanentCard >> isPlayableBy: aPlayer in: aGame [
	(aGame handOf: aPlayer) detect: [ :card | card = self ] ifNone: [ AssertionFailure signal: 'The player does not possess a card' ].
	aPlayer = aGame currentPlayer
		ifFalse: [ AssertionFailure signal: 'Permanent Cards can only be played in the player´s turn' ]
]

{ #category : #actions }
PermanentCard >> tilesToMove [
self subclassResponsibility 
]
