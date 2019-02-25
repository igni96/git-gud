Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'positions',
		'dices',
		'turn',
		'stateOfGame',
		'board',
		'winningLap',
		'cardGenerator',
		'playerHands',
		'activePermanentCards',
		'lastTileActivated',
		'lastCardActivated',
		'discardDeck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #asserting }
Game class >> assertNumberOfTilesGreaterThanZero: aBoard [
	((aBoard tiles size) < 0)
		ifTrue: [ AssertionFailure signal: 'The number of tiles in the board must be greater than zero' ]
]

{ #category : #initialization }
Game class >> playedBy: aPlayerArray throwing: aDiceArray onABoard: aBoard usingDeck: aDeck withNumberOfLaps: aNumberOfLaps [
	self assertNumberOfTilesGreaterThanZero: aBoard.
	^ self new
		initializePlayedBy: aPlayerArray
		throwing: aDiceArray
		onABoard: aBoard
		usingDeck: aDeck
		withNumberOfLaps: aNumberOfLaps
]

{ #category : #adding }
Game >> addPermanentCard: aCard to: aPlayer [
(activePermanentCards at: aPlayer) add: aCard
]

{ #category : #actions }
Game >> advanceTurn [
	turn := turn + 1 > self players size
		ifTrue: [ 1 ]
		ifFalse: [ turn + 1 ]
]

{ #category : #accessing }
Game >> amountOfActivePermanentCardsfor: aPlayer [
^(activePermanentCards at: aPlayer)size.
]

{ #category : #asserting }
Game >> assertCanPlay: aPlayer [
	^ (self currentPlayer ) = aPlayer
		ifFalse: [ AssertionFailure signal: 'It´s not the player´s turn' ]
]

{ #category : #asserting }
Game >> assertPlayerExists: aPlayer [
((self players) includes: aPlayer)
ifFalse: [ AssertionFailure signal: 'The player does not exist' ].
]

{ #category : #actions }
Game >> calculateTilesToMoveFor: aPlayer [
	| totalRoll |
	totalRoll := dices sumNumbers: [ :dice | dice throw ].
	totalRoll := totalRoll + ((activePermanentCards at: aPlayer) sumNumbers: [ :card | card tilesToMove ]).
	^totalRoll.
]

{ #category : #actions }
Game >> changePositionOf: aPlayer by: anAmount [
	positions at: aPlayer put: (Position movingFrom: (positions at: aPlayer) forAnAmountOfSpaces: anAmount onABoardOfSize: (board tiles ) size)
]

{ #category : #accessing }
Game >> currentPlayer [
	^self players at: turn.
]

{ #category : #accessing }
Game >> currentTilefor: aPlayer [
	^ board tiles at: (self spaceOf: aPlayer)
]

{ #category : #actions }
Game >> drawCardForPlayer: aPlayer [
	(self handOf: aPlayer) add: (cardGenerator drawCardForGame: self)
]

{ #category : #accessing }
Game >> handOf: aPlayer [
	^ playerHands at: aPlayer ifAbsent: [ AssertionFailure signal: 'The player does not exist'  ]
]

{ #category : #asserting }
Game >> hasEnded [
	^stateOfGame hasEnded.
]

{ #category : #initialization }
Game >> initializePlayedBy: aGroupOfPlayers throwing: aGroupOfDices onABoard: aBoard usingDeck: aDeck withNumberOfLaps: aNumberOfLaps [
	dices := aGroupOfDices.
	board := aBoard.
	turn := 1.
	stateOfGame := GamePlaying new.
	positions := Dictionary new.
	cardGenerator := aDeck.
	discardDeck:= DiscardDeck atStart .
	winningLap := aNumberOfLaps.
	playerHands := Dictionary new.
	activePermanentCards := Dictionary new.
	lastTileActivated := NormalTile new -> (aGroupOfPlayers at: 1).
	lastCardActivated := NoEffectCard new.
	self preparePlayers: aGroupOfPlayers
]

{ #category : #accessing }
Game >> lapOf: aPlayer [
	^ (positions at: aPlayer ifAbsent: [ AssertionFailure signal: 'The player does not exist' ]) currentLap
]

{ #category : #accessing }
Game >> lastCardActivated [
	^ lastCardActivated
]

{ #category : #accessing }
Game >> lastTileActivated [
	^ (lastTileActivated key)
]

{ #category : #accessing }
Game >> lastTileActivator [
	^ (lastTileActivated value)
]

{ #category : #accessing }
Game >> placeOf: aPlayer [
	^ (self players asSortedCollection: [ :player | self lapOf: player ] descending , [ :player | self spaceOf: player ] descending)
		detectIndex: [ :player | player = aPlayer ]
		ifNone: [ AssertionFailure signal: 'The player does not exist' ]
]

{ #category : #actions }
Game >> playCard: aCard fromPlayer: aPlayer [
	stateOfGame assertCanPlayCard.
	
	aCard isPlayableBy: aPlayer in: self.
	aCard activateCardEffectIn: self.
	discardDeck addCard: aCard.
	lastCardActivated := aCard.
	(self handOf: aPlayer) remove: aCard
]

{ #category : #actions }
Game >> playCard: aCard fromPlayer: aPlayer forCard: targetCard [
	stateOfGame assertCanPlayCard.
	activePermanentCards values
		detect: [ :cardsOfPlayer | cardsOfPlayer includes: targetCard ]
		ifNone: [ AssertionFailure signal: 'Cancellation requires an active permanent card to cancel' ].
	aCard isPlayableBy: aPlayer in: self.
	aCard activateCardEffectForCard: targetCard in: self.
	discardDeck addCard: aCard.
	lastCardActivated := aCard.
	(self handOf: aPlayer) remove: aCard
]

{ #category : #actions }
Game >> playCard: aCard fromPlayer: aPlayer forPlayer: targetPlayer [
	stateOfGame assertCanPlayCard.
	aCard isPlayableBy: aPlayer in: self.
	aCard activateCardEffectForPlayer: targetPlayer in: self.
	discardDeck addCard: aCard.
	lastCardActivated := aCard.
	(self handOf: aPlayer) remove: aCard
]

{ #category : #accessing }
Game >> playTurnFor: aPlayer [
	self changePositionOf: aPlayer by: (self calculateTilesToMoveFor: aPlayer).
	
	lastTileActivated := (self currentTilefor: aPlayer) -> aPlayer.
	(self currentTilefor: aPlayer) activateEffectforGame: self forPlayer: self currentPlayer.

	(self lapOf: aPlayer) >= winningLap
		ifTrue: [ self updateGameState ]
]

{ #category : #accessing }
Game >> players [
^(positions keysSortedSafely)
]

{ #category : #initialization }
Game >> preparePlayers: aGroupOfPlayers [
	aGroupOfPlayers
		do: [ :player | 
			positions at: player put: (Position atStart).
			playerHands at: player put: OrderedCollection new.
			self drawCardForPlayer: player.
			self drawCardForPlayer: player.
			activePermanentCards at: player put: OrderedCollection new ]
]

{ #category : #actions }
Game >> refillDeck [
^discardDeck refillDeck 
]

{ #category : #removing }
Game >> removePermanentCard: aCard from: aPlayer [
	(activePermanentCards at: aPlayer) removeAllSuchThat: [ :card | aCard = card ]
]

{ #category : #accessing }
Game >> spaceOf: aPlayer [
	^ (positions at: aPlayer ifAbsent: [ AssertionFailure signal: 'The player does not exist' ])currentSpace
]

{ #category : #actions }
Game >> turnOf: aPlayer [
	stateOfGame turnOf: aPlayer in: self.
]

{ #category : #actions }
Game >> turnOfWhenGameHasEnded: aPlayer [
	AssertionFailure signal: 'The game has already ended'
]

{ #category : #accessing }
Game >> turnOfWhenGameIsBeingPlayed: aPlayer [
	
	self assertCanPlay: aPlayer.
	self playTurnFor: aPlayer.
	self advanceTurn
]

{ #category : #actions }
Game >> updateGameState [
stateOfGame := GameEnded new.
]

{ #category : #actions }
Game >> whenGameHasEndedWonBy: aPlayer [
	^((self placeOf: aPlayer )=1)
]

{ #category : #actions }
Game >> whenGameIsBeingPlayedwonBy: aPlayer [
	^ AssertionFailure signal: 'The game has not ended yet'
]

{ #category : #accessing }
Game >> wonBy: aPlayer [
	^stateOfGame wonBy: aPlayer in: self.
]
