Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
Card >> isPlayableBy: aPlayer in: aGame [
	self subclassResponsibility 
]
