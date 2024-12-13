"
I am a session of a game of Gin Rummy.
"
Class {
	#name : 'Game',
	#superclass : 'Object',
	#instVars : [
		'id',
		'deck',
		'discard',
		'players',
		'semaphore',
		'currentPlayer'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'accessing' }
Game >> currentPlayer [

	^ currentPlayer
]

{ #category : 'accessing' }
Game >> deck [

	^ deck.
]

{ #category : 'accessing' }
Game >> discard [

	^ discard ifNil: [discard := CardStack new]
]

{ #category : 'as yet unclassified' }
Game >> getNextPlayer [

	^ (currentPlayer >= players size) ifTrue: [ 1 ] ifFalse: [ currentPlayer := currentPlayer + 1 ]
]

{ #category : 'initialization' }
Game >> initialize [ 

	deck := CardStack newWith52Cards.
	players := #(1 2) collect: [ :_ | Player newWithGame: self ].
	currentPlayer := 1.
	self startHand.
]

{ #category : 'testing' }
Game >> isCurrentPlayer: aPlayer [

	^ ( players at: currentPlayer ) == aPlayer
]

{ #category : 'accessing' }
Game >> players [

	^ players
]

{ #category : 'gameplay' }
Game >> popDiscard [

	^ discard removeLast
]

{ #category : 'gameplay' }
Game >> popStock [

	^ deck removeLast
]

{ #category : 'gameplay' }
Game >> pushDiscard: aCard [

	self rotatePlayer.
	discard add: aCard.
	self semaphore signalAll.
	self semaphore wait.
]

{ #category : 'as yet unclassified' }
Game >> rotatePlayer [

	currentPlayer := self getNextPlayer
]

{ #category : 'accessing' }
Game >> semaphore [

	^ semaphore ifNil: [semaphore := Semaphore new]
]

{ #category : 'gameplay' }
Game >> startHand [

	players do: [ :player |
		deck addAll: player hand.
		player hand removeAll. ].
	deck addAll: self discard.
	discard removeAll.
	deck shuffle.
	1 to: 10 do: [ :_ | players do: [ :player |
		player hand add: deck removeFirst ] ].
	currentPlayer := 1.
	discard add: deck removeFirst.
]
