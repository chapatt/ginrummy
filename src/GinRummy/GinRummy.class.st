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

	^ Classification
]

{ #category : 'initialization' }
GinRummy class >> initialize [ 

	Classification := Namespace new.
	Classification bind: #card to: 'card'.
	Classification bind: #selected to: 'selected'.
]
