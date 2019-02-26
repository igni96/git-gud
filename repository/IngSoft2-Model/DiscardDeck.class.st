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

{ #category : #accessing }
DiscardDeck >> refillDeck [
	| aGroupOfCards |
	cards isEmpty
		ifTrue: [ AssertionFailure signal: 'The deck is empty and there are no cards in the discard deck' ]
		ifFalse: [ aGroupOfCards := cards copy.
			cards removeAll.
			^ aGroupOfCards ]
]
