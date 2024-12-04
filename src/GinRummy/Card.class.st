Class {
	#name : 'Card',
	#superclass : 'WAPainter',
	#instVars : [
		'value'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'instance creation' }
Card class >> newWithValue: aValue [

	^ (self new)
		value: aValue;
		yourself.
]

{ #category : 'rendering' }
Card >> renderContentOn: aCanvas [
		
	aCanvas image url: 'images/', value, '.svg';
		style: 'width: 5em';
		altText: '5 of Spades'.
]

{ #category : 'accessing' }
Card >> value: aValue [

	value := aValue.
]
