Class {
	#name : 'CardComponent',
	#superclass : 'WAPainter',
	#instVars : [
		'value',
		'announcer'
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

{ #category : 'accessing' }
CardComponent >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'rendering' }
CardComponent >> renderContentOn: aCanvas [
	| button |
	
	button := ImageWebView locatedAt: 'images/', value, '.svg' applying: [ :anImage |
		( anImage addScript js: [ :canvas | canvas jQuery this dataAt: 'value' put: value ] ) + anImage addClass card ].
	button on click
		serverDo: [ self announcer announce: ( CardSelectedAnnouncement newWithValue: value ) ].
	aCanvas render: button.
]

{ #category : 'accessing' }
CardComponent >> value: aValue [

	value := aValue.
]
