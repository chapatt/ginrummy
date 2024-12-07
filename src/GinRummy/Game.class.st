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
		'players'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'accessing' }
Game >> deck [

	^ deck.
]

{ #category : 'accessing' }
Game >> discard [

	^ discard ifNil: [discard := CardStack new]
]

{ #category : 'initialization' }
Game >> initialize [ 

	deck := CardStack newWith52Cards.
	players := #(1 2) collect: [ :_ | Player newWithGame: self ].
	self startHand.
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
Game >> startHand [

	players do: [ :player |
		deck addAll: player hand.
		player hand removeAll. ].
	deck addAll: self discard.
	discard removeAll.
	deck shuffle.
	1 to: 10 do: [ :_ | players do: [ :player |
		player hand add: deck removeFirst ] ].
	discard add: deck removeFirst.
]
