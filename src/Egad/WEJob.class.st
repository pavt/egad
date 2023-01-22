"
The class `WEJob` implement the jobs of a Github Action workflow.
"
Class {
	#name : #WEJob,
	#superclass : #WENamedEntity,
	#instVars : [
		'steps'
	],
	#category : #'Egad-Model'
}

{ #category : #accessing }
WEJob >> data: aDictionary [
	super data: aDictionary.
	self initializeSteps.
	"self name: (data at: 'name')"
]

{ #category : #accessing }
WEJob >> gtStepsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Steps';
		priority: 30;
		items: [ self steps ];
		column: 'Step' text: [ :step | step ];
		column: 'with' text: [ :step | step with asString ];
		column: 'uses' text: [ :step | step uses asString ];
		column: 'name' text: [ :step | step name asString ]
]

{ #category : #initialization }
WEJob >> initializeSteps [
	steps := (data at: 'steps' ifAbsent: [ Dictionary new ])
			collect: [ :dict | WEStep new data: dict ]
]

{ #category : #accessing }
WEJob >> steps [
	^ steps
]
