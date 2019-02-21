Class {
	#name : #DeterministicDice,
	#superclass : #Dice,
	#instVars : [
		'futureThrows',
		'nextThrow'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
DeterministicDice class >> withFutureThrows: aThrowsArray andSides: aNumberOfSides [
	self assertValidNumberOfSides: aNumberOfSides.
	^ self new initializeWithFutureThrows: aThrowsArray andSides: aNumberOfSides
]

{ #category : #initialization }
DeterministicDice >> initializeWithFutureThrows: throws andSides: aNumberOfSides [
	quantityOfSides := aNumberOfSides.
	nextThrow := 0.
	futureThrows := throws select: [ :number | number between: 0 and: aNumberOfSides].
]

{ #category : #actions }
DeterministicDice >> throw [
	nextThrow := nextThrow + 1.
	^ futureThrows at: nextThrow
]
