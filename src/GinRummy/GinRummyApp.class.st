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
	| deckContainer discardContainer handContainer field newRoundButton drawStockButton drawUpcardButton button textField|
	
	field := self componentSupplier naturalNumberFieldApplying: [ :aField | ].
	field changeNumberTo: 2.
	
	deckContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas | aCanvas render: (CardStackComponent
		newWithCardStack: self class sharedGame deck) ]
		applying: [ ].
		
	discardContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas | aCanvas render: (CardStackComponent
		newWithCardStack: self class sharedGame discard) ]
		applying: [ ].
		
	handContainer := self componentSupplier divisionContainerWrapping: [ :aCanvas | aCanvas render: (CardStackComponent
		newWithCardStack: (self class sharedGame players at: field number) hand) ]
		applying: [ ].
	field on trigger render: handContainer.
	
	newRoundButton := self componentSupplier asynchronicButtonLabeled: 'Shuffle and Deal' applying: [ :aButton | ].
	newRoundButton on click
		serverDo: [self class sharedGame startHand ];
		render: handContainer;
		render: deckContainer;
		render: discardContainer.
		
	drawStockButton := self componentSupplier asynchronicButtonLabeled: 'Draw from Stock' applying: [ :aButton | ].
	drawStockButton on click
		serverDo: [(self class sharedGame players at: field number) drawStock ];
		render: handContainer;
		render: deckContainer.
		
	drawUpcardButton := self componentSupplier asynchronicButtonLabeled: 'Draw Upcard' applying: [ :aButton | ].
	drawUpcardButton on click
		serverDo: [(self class sharedGame players at: field number) drawUpcard ];
		render: handContainer;
		render: discardContainer.
		


	textField := self componentSupplier singleLineTextFieldApplying:
		[ :theField | theField setPlaceholderTo: 'Write your task' ].
	button := self componentSupplier asynchronicButtonLabeled: 'Click me' applying: [ :theButton | ].
	button on trigger
		setValueTo: [ self class sharedGame semaphore wait. 'foo!' ]
		withoutTriggeringChangeOf: textField.



	^ [ :canvas |
			canvas render: textField.
			canvas render: button.
			
			
			
			canvas break.
			canvas heading level1 with: 'Gin Rummy'.
			canvas render: field.
			canvas break.
			canvas render: newRoundButton.
			canvas break.
			canvas render: drawStockButton.
			canvas break.
			canvas render: drawUpcardButton.
			canvas horizontalRule.
			canvas heading level2 with: 'Deck'.
			canvas render: deckContainer.
			canvas horizontalRule.
			canvas heading level2 with: 'Discard'.
			canvas render: discardContainer.
			canvas horizontalRule.
			canvas heading level2 with: 'Player Hand'.
			canvas render: handContainer.
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
