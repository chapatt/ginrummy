Class {
	#name : 'CardComponent',
	#superclass : 'WAPainter',
	#instVars : [
		'value'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'instance creation' }
CardComponent class >> newWithValue: aValue [

	^ (self new)
		value: aValue;
		yourself.
]

{ #category : 'rendering' }
CardComponent >> renderContentOn: aCanvas [
		
	aCanvas image url: 'images/', value, '.svg';
		altText: value;
		class: 'card'.
]

{ #category : 'accessing' }
CardComponent >> value: aValue [

	value := aValue.
]
