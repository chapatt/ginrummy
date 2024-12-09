Class {
	#name : 'CardStackComponent',
	#superclass : 'WAPainter',
	#instVars : [
		'cards',
		'cardStack'
	],
	#classInstVars : [
		'cardStack',
		'cards'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'instance creation' }
CardStackComponent class >> newWithCardStack: aCardStack [

	^ (self new)
		cardStack: aCardStack;
		yourself.
]

{ #category : 'accessing' }
CardStackComponent >> cardStack: aCardStack [

	cardStack := aCardStack
]

{ #category : 'rendering' }
CardStackComponent >> renderContentOn: aCanvas [
		
	cards := cardStack collect: [ :cardValue | CardComponent newWithValue: cardValue ].
	aCanvas unorderedList
		class: 'hand';
		addAll: cards
]
