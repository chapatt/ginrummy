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

{ #category : 'as yet unclassified' }
CardStackComponent >> onDiscard: aBlock [
]

{ #category : 'rendering' }
CardStackComponent >> renderContentOn: aCanvas [
	| card |

	cards := cardStack collect: [ :cardValue |
		card := CardComponent newWithValue: cardValue.
		card announcer when: CardSelectedAnnouncement do: [ ] for: self.
		card ].
	aCanvas orderedList
		class: 'hand';
		addAll: cards
]
