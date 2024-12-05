"
I am the main Willow application for the Gin Rummy game.
"
Class {
	#name : 'GinRummyApp',
	#superclass : 'WillowApplication',
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'accessing' }
GinRummyApp class >> applicationTitle [

	^ 'Gin Rummy'
]

{ #category : 'accessing' }
GinRummyApp class >> handlerName [

	^ 'ginrummy'
]

{ #category : 'accessing' }
GinRummyApp >> applicationTitle [
	^ self class applicationTitle
]

{ #category : 'accessing' }
GinRummyApp >> componentSupplierForApplication [

	^ Html5ComponentSupplier new
]

{ #category : 'accessing' }
GinRummyApp >> contentView [
	| game cardElements player1CardElements player2CardElements container button |

	game := Game new.
	cardElements := game deck collect: [ :card | Card newWithValue: card ].
	player1CardElements := (game players at: 1) hand collect: [ :card | Card newWithValue: card ].
	player2CardElements := (game players at: 2) hand collect: [ :card | Card newWithValue: card ].
		
	container := self componentSupplier divisionContainerWrapping: [ :canvas | canvas unorderedList
			class: 'hand';
			addAll: player2CardElements. ]
		applying: [ ].
	
	button := self componentSupplier asynchronicButtonLabeled: 'Shuffle and Deal' applying: [ :button | ].
	button on click
		serverDo: [game startHand.
			player2CardElements := (game players at: 2) hand collect: [ :card | Card newWithValue: card ]. ];
		render: container.

	^ [ :canvas |
			canvas heading level1 with: 'Gin Rummy'.
			canvas render: button.
			canvas horizontalRule.
			canvas heading level2 with: 'Deck'.
			canvas unorderedList
				class: 'hand';
				addAll: cardElements.
			canvas horizontalRule.
			canvas heading level2 with: 'Player 1 Hand'.
			canvas unorderedList
				class: 'hand';
				addAll: player1CardElements.
			canvas horizontalRule.
			canvas heading level2 with: 'Player 2 Hand'.
			canvas render: container.
		 ]
]

{ #category : 'accessing' }
GinRummyApp >> handlerName [
	^ self class handlerName
]

{ #category : 'accessing' }
GinRummyApp >> jQueryLibrary [

    ^JQuery3OnlineLibrary default
]

{ #category : 'accessing' }
GinRummyApp >> requiredLibraries [ 

	^ { StyleLibrary new }
]
