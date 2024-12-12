Class {
	#name : 'CardSelectedAnnouncement',
	#superclass : 'Announcement',
	#instVars : [
		'value'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'instance creation' }
CardSelectedAnnouncement class >> newWithValue: aValue [

	^ (self new)
		value: aValue;
		yourself.
]

{ #category : 'evaluating' }
CardSelectedAnnouncement >> value [

	^ value
]

{ #category : 'accessing' }
CardSelectedAnnouncement >> value: aValue [

	value := aValue
]
