Class {
	#name : #DeterministicDeck,
	#superclass : #Deck,
	#instVars : [
		'futureCards'
	],
	#classInstVars : [
		'futureCards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
DeterministicDeck class >> withFutureCards: aCardsArray [
	^self new initializeWithFutureCards: aCardsArray.
	
]

{ #category : #actions }
DeterministicDeck >> drawCard [
	| nextCard |
	futureCards isEmpty
		ifTrue: [ AssertionFailure signal: 'The deck is out of cards' ]
		ifFalse: [ nextCard := futureCards removeFirst ].
	^ nextCard
]

{ #category : #initialization }
DeterministicDeck >> initializeWithFutureCards: aCardsArray [
	futureCards := aCardsArray.
	
]
