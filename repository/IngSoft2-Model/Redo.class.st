Class {
	#name : #Redo,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #actions }
Redo >> activateCardEffectForCard: aTargetCard in: aGame [
	aGame lastCardActivated activateCardEffectForCard: aTargetCard in: aGame
]

{ #category : #actions }
Redo >> activateCardEffectForPlayer: aTargetPlayer in: aGame [
	aGame lastCardActivated activateCardEffectForPlayer: aTargetPlayer in: aGame
]

{ #category : #actions }
Redo >> activateCardEffectIn: aGame [
	aGame lastCardActivated activateCardEffectIn: aGame
]
