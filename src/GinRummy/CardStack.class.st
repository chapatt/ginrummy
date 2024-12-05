Class {
	#name : 'CardStack',
	#superclass : 'OrderedCollection',
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'instance creation' }
CardStack class >> newWith52Cards [
	"Initialize a new deck with 52 basic cards"
	
	^self newFrom: {
		'AC'. '2C'. '3C'. '4C'. '5C'. '6C'. '7C'. '8C'. '9C'. 'TC'. 'JC'. 'QC'. 'KC'.
		'AD'. '2D'. '3D'. '4D'. '5D'. '6D'. '7D'. '8D'. '9D'. 'TD'. 'JD'. 'QD'. 'KD'.
		'AH'. '2H'. '3H'. '4H'. '5H'. '6H'. '7H'. '8H'. '9H'. 'TH'. 'JH'. 'QH'. 'KH'.
		'AS'. '2S'. '3S'. '4S'. '5S'. '6S'. '7S'. '8S'. '9S'. 'TS'. 'JS'. 'QS'. 'QS' }
]