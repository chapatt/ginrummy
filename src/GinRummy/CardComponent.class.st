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
	
	button := ImageWebView locatedAt: 'images/', value, '.svg' applying: [ :anImage | anImage addClass card ].
	button on click
		updateCssClasses: [ :classes | classes removeClass: 'selected' ]
			onElementsMatching: [ :canvas | (canvas jQuery this closest: '.hand') find: '.card' ];
		updateCssClasses: [ :classes | classes addClass: 'selected' ]
			onElementsMatching: [ :canvas | canvas jQuery this ];
		userAgentDo: [ :canvas | canvas jQuery this ];
		serverDo: [ self announcer announce: CardSelectedAnnouncement new ].
	aCanvas render: button.
]

{ #category : 'accessing' }
CardComponent >> value: aValue [

	value := aValue.
]
