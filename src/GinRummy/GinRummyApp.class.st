"
I am the main Willow application for the Gin Rummy game.
"
Class {
	#name : 'GinRummyApp',
	#superclass : 'WillowApplication',
	#classVars : [
		'SharedGame'
	],
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
GinRummyApp class >> sharedGame [

  ^ SharedGame ifNil: [SharedGame := Game new]
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
	| deckCardElements discardCardElements player1CardElements player2CardElements playerHandContainer field button |

	deckCardElements := self class sharedGame deck collect: [ :card | Card newWithValue: card ].
	discardCardElements := self class sharedGame discard collect: [ :card | Card newWithValue: card ].
	player1CardElements := (self class sharedGame players at: 1) hand collect: [ :card | Card newWithValue: card ].
	player2CardElements := (self class sharedGame players at: 2) hand collect: [ :card | Card newWithValue: card ].
	
	field := self componentSupplier naturalNumberFieldApplying: [ :aField | ].
	field changeNumberTo: 2.
		
	playerHandContainer := self componentSupplier divisionContainerWrapping: [ :canvas |
			field number = 1 ifTrue: [
				canvas unorderedList
					class: 'hand';
					addAll: player1CardElements. ]
				ifFalse: [ field number = 2 ifTrue: [ 
						canvas unorderedList
							class: 'hand';
							addAll: player2CardElements. ] ] ]
		applying: [ ].
	field on trigger render: playerHandContainer.
	
	button := self componentSupplier asynchronicButtonLabeled: 'Shuffle and Deal' applying: [ :button | ].
	button on click
		serverDo: [self class sharedGame startHand.
			player2CardElements := (self class sharedGame players at: 2) hand collect: [ :card | Card newWithValue: card ]. ];
		render: playerHandContainer.

	^ [ :canvas |
			canvas heading level1 with: 'Gin Rummy'.
			canvas render: field.
			canvas break.
			canvas render: button.
			canvas horizontalRule.
			canvas heading level2 with: 'Deck'.
			canvas unorderedList
				class: 'hand';
				addAll: deckCardElements.
			canvas horizontalRule.
			canvas heading level2 with: 'Discard'.
			canvas unorderedList
				class: 'hand';
				addAll: discardCardElements.
			canvas horizontalRule.
			canvas heading level2 with: 'Player Hand'.
			canvas render: playerHandContainer.
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
