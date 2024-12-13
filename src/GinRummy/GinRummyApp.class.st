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
	| deckContainer discardContainer handContainer field newRoundButton drawStockButton drawUpcardButton handComponent selectedCard discardButton deckComponent discardComponent actionsContainer currentPlayerContainer |
	
	currentPlayerContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas | aCanvas paragraph: 'Current Player: ', self class sharedGame currentPlayer asString. ]
	applying: [ ].
	
	field := self componentSupplier naturalNumberFieldApplying: [ :aField | ].
	field changeNumberTo: 1.

	deckComponent := CardComponent newWithValue: '1B'.
	deckContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas | aCanvas render: deckComponent ] applying: [ ].
	
	discardComponent := CardComponent new.
	discardContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas |
			self class sharedGame discard ifNotEmpty: [ discardComponent value: self class sharedGame discard last. aCanvas render: discardComponent ] ]
		applying: [ ].
		
	handComponent := CardStackComponent
			new.
	handComponent announcer when: CardSelectedAnnouncement do: [ :announcement | selectedCard := announcement value ] for: self.
	handContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas | handComponent cardStack: (self class sharedGame players at: field number) hand.
			aCanvas render: handComponent ]
		applying: [ ].
	field on trigger render: handContainer.
	
	newRoundButton := self componentSupplier asynchronicButtonLabeled: 'Shuffle and Deal' applying: [ :aButton | ].
		
	actionsContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas |
			drawStockButton := self componentSupplier asynchronicButtonLabeled: 'Draw from Stock'
				applying: [ :aButton | ( self class sharedGame players at: field number ) canDraw ifFalse: [ aButton beDisabled ] ].
			drawStockButton on click
				serverDo: [(self class sharedGame players at: field number) drawStock ];
				render: handContainer;
				render: deckContainer;
				render: actionsContainer.
			aCanvas render: drawStockButton.
			
			aCanvas break.
			
			drawUpcardButton := self componentSupplier asynchronicButtonLabeled: 'Draw Upcard' applying: [ :aButton | ( self class sharedGame players at: field number ) canDraw ifFalse: [ aButton beDisabled ] ].
			drawUpcardButton on click
				serverDo: [(self class sharedGame players at: field number) drawUpcard ];
				render: handContainer;
				render: discardContainer;
				render: actionsContainer.
			aCanvas render: drawUpcardButton.
			
			aCanvas break.
			
			discardButton := self componentSupplier asynchronicButtonLabeled: 'Discard Selected Card' applying: [ :aButton | ( self class sharedGame players at: field number ) canDiscard ifFalse: [ aButton beDisabled ] ].
	discardButton on click
				serverDo: [ (self class sharedGame players at: field number) discard: selectedCard ];
				render: currentPlayerContainer;
				render: handContainer;
				render: discardContainer;
				render: actionsContainer.
			aCanvas render: discardButton ]
		applying: [ ].
		

	field on trigger render: actionsContainer.
	
	newRoundButton on click
		serverDo: [self class sharedGame startHand ];
		render: currentPlayerContainer;
		render: handContainer;
		render: deckContainer;
		render: discardContainer;
		render: actionsContainer.

	^ [ :canvas |
			canvas render: currentPlayerContainer.
			canvas break.
			canvas heading level1 with: 'Gin Rummy'.
			canvas render: field.
			canvas break.
			canvas render: newRoundButton.
			canvas break.
			canvas render: actionsContainer.
			canvas horizontalRule.
			canvas heading level2 with: 'Deck'.
			canvas render: deckContainer.
			canvas horizontalRule.
			canvas heading level2 with: 'Discard'.
			canvas render: discardContainer.
			canvas horizontalRule.
			canvas heading level2 with: 'Player Hand'.
			canvas render: handContainer ]
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
