Extension { #name : 'ComponentClassificationCommandBuilder' }

{ #category : '*GinRummy' }
ComponentClassificationCommandBuilder >> card [

	^ self commandStyledWith: #card
]

{ #category : '*GinRummy' }
ComponentClassificationCommandBuilder >> hand [

	^ self commandStyledWith: #hand
]

{ #category : '*GinRummy' }
ComponentClassificationCommandBuilder >> selected [

	^ self commandStyledWith: #selected
]
