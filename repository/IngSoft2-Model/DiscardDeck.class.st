Class {
	#name : #DiscardDeck,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
DiscardDeck class >> atStart [
^self new initializeWithoutCards
]

{ #category : #adding }
DiscardDeck >> addCard: aCard [
cards add: aCard.
]

{ #category : #initialization }
DiscardDeck >> initializeWithoutCards [
cards:=OrderedCollection new.
]

{ #category : #'as yet unclassified' }
DiscardDeck >> refillDeck [
	| aGroupOfCards |
	cards isEmpty
		ifTrue: [ AssertionFailure signal: 'The discard deck is empty' ]
		ifFalse: [ aGroupOfCards := cards shuffled.
			cards removeAll.
			^ aGroupOfCards ]
]
