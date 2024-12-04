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

	^ [ :canvas | canvas unorderedList
			style: 'list-style-type: none';
			add: (Card newWithValue: '5S');
			add: (Card newWithValue: '6D') ]
]

{ #category : 'accessing' }
GinRummyApp >> handlerName [
	^ self class handlerName
]

{ #category : 'accessing' }
GinRummyApp >> jQueryLibrary [

    ^JQuery3OnlineLibrary default
]
