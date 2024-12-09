Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'hand',
		'game'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'instance creation' }
Player class >> newWithGame: aGame [

	^ (self new)
		game: aGame;
		yourself.
]

{ #category : 'gameplay' }
Player >> discard: aCard [

	game pushDiscard: (hand remove: aCard)
]

{ #category : 'gameplay' }
Player >> drawStock [

	hand add: game popStock
]

{ #category : 'gameplay' }
Player >> drawUpcard [

	hand add: game popDiscard
]

{ #category : 'accessing' }
Player >> game: aGame [

	game := aGame
]

{ #category : 'accessing' }
Player >> hand [

  ^ hand ifNil: [hand := CardStack new]
]
