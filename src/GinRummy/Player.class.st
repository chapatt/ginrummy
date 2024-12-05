Class {
	#name : 'Player',
	#superclass : 'Object',
	#instVars : [
		'hand'
	],
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'accessing' }
Player >> hand [

  ^ hand ifNil: [hand := CardStack new]
]
