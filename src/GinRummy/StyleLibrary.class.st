Class {
	#name : 'StyleLibrary',
	#superclass : 'Object',
	#category : 'GinRummy',
	#package : 'GinRummy'
}

{ #category : 'updating' }
StyleLibrary >> updateRoot: aRoot [
	| stylesheet |

	stylesheet := CascadingStyleSheetBuilder new
		declareRuleSetFor: [:selector | selector class: 'hand' ]
			with: [:style | style listStyleType: #none ];
		declareRuleSetFor: [:selector | (selector unorderedList class: 'hand') listItem ]
			with: [:style | style
				display: #inline;
				marginLeft: '-1.5em' ];
		declareRuleSetFor: [:selector | selector class: 'card' ]
			with: [:style | style width: '5em' ];
		build.

	aRoot style: stylesheet.
]
