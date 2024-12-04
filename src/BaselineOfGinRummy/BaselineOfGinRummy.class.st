"
I am a baseline for the GinRummy package.
"
Class {
	#name : 'BaselineOfGinRummy',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGinRummy',
	#package : 'BaselineOfGinRummy'
}

{ #category : 'baselines' }
BaselineOfGinRummy >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			self setUpDependencies: spec.
			spec
				package: 'GinRummy' with: [ spec requires: #('Willow-Deployment') ];
				package: 'GinRummy-Tests' with: [ spec requires: #('GinRummy') ]
		]
]

{ #category : 'accessing' }
BaselineOfGinRummy >> projectClass [
	^ MetacelloCypressBaselineProject
]

{ #category : 'initialization' }
BaselineOfGinRummy >> setUpDependencies: spec [

	spec baseline: 'Willow' with: [ spec repository: 'github://ba-st/Willow:v15' ];
		project: 'Willow-Deployment' copyFrom: 'Willow' with: [ spec loads: 'Deployment' ]
]
