Class {
	#name : 'GinRummy',
	#superclass : 'Object',
	#classVars : [
		'Classification'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'accessing' }
GinRummy class >> classification [

	^ Willow classification 
]

{ #category : 'initialization' }
GinRummy class >> initialize [ 

	self classification bind: #hand to: 'hand'.
	self classification bind: #card to: 'card'.
	self classification bind: #selected to: 'selected'.
]
