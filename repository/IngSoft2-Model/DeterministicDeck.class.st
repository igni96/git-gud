Class {
	#name : #DeterministicDeck,
	#superclass : #Deck,
	#instVars : [
		'cards'
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
^cards 
]

{ #category : #actions }
DeterministicDeck >> drawCardInGame: aGame [
	

	cards isEmpty
		ifTrue: [ cards addAll: aGame refillDeck ].
	^ cards removeFirst
	
]

{ #category : #initialization }
DeterministicDeck >> initializeWithFutureCards: aCardsArray [
	cards := aCardsArray.
	
]
