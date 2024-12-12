Class {
	#name : 'CardStackComponent',
	#superclass : 'WAPainter',
	#instVars : [
		'cards',
		'cardStack',
		'announcer'
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
CardStackComponent >> announcer [

	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : 'accessing' }
CardStackComponent >> cardStack: aCardStack [

	cardStack := aCardStack
]

{ #category : 'rendering' }
CardStackComponent >> renderContentOn: aCanvas [
	| card list |

	cards := cardStack collect: [ :cardValue |
		card := CardComponent newWithValue: cardValue.
		card announcer when: CardSelectedAnnouncement do: [ self announcer announce: ( CardSelectedAnnouncement newWithValue: cardValue ) ] for: self.
		card ].
	list := UnorderedListWebView new
		initializeApplying: [ :aBuilder | aBuilder addClass hand ]
		listing: cards
		applyingToEach: [ :aBuilder | aBuilder addScript js: [ :itemCanvas |
			( itemCanvas jQuery this find: '.card' )
				on: 'click'
				do: ( ( ( itemCanvas jQuery this closest: '.hand' ) find: 'li' ) removeClass: 'selected' ),
				( ( itemCanvas jQuery this closest: 'li' ) addClass: 'selected' ) ] ].
	aCanvas render: list.
]
