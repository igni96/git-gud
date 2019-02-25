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

{ #category : #accesing }
DeterministicDeck >> cards [
^futureCards 
]

{ #category : #actions }
DeterministicDeck >> drawCardForGame: aGame [
	| nextCard |
	futureCards isEmpty
		ifTrue: [ futureCards addAll: aGame refillDeck.
			nextCard := futureCards removeFirst ]
		ifFalse: [ nextCard := futureCards removeFirst ].
	^ nextCard
]

{ #category : #initialization }
DeterministicDeck >> initializeWithFutureCards: aCardsArray [
	futureCards := aCardsArray.
	
]
