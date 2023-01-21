Class {
	#name : #WEWorkflow,
	#superclass : #WENamedEntity,
	#instVars : [
		'events',
		'jobs',
		'file'
	],
	#category : #Egad
}

{ #category : #accessing }
WEWorkflow class >> fromFile: aFileReference [
	^ self new
		file: aFileReference;
		data: (STON fromString: aFileReference contents)
]

{ #category : #initialization }
WEWorkflow >> data: aDictionary [
	super data: aDictionary.
	self initializeEvents.
	self initializeJobs.
	self name: (data at: 'name' ifAbsent: ['(missing name)'])
]

{ #category : #accessing }
WEWorkflow >> events [
	^ events
]

{ #category : #accessing }
WEWorkflow >> file [
	^ file
]

{ #category : #accessing }
WEWorkflow >> file: aFileReference [
	file := aFileReference 
]

{ #category : #accessing }
WEWorkflow >> gtEventsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Events';
		priority: 30;
		items: [ self events ];
		column: 'Event' text: [ :event | event name ]
]

{ #category : #accessing }
WEWorkflow >> gtJSONSourceFor: aView [
	<gtView>
	^ aView forward
		title: 'JSON Source';
		priority: 10;
		object: [ file ];
		"gtViewsFor: #gtJsonFor"
		view: #gtJsonFor:
]

{ #category : #accessing }
WEWorkflow >> gtJobsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Jobs';
		priority: 30;
		items: [ self jobs ];
		column: 'Job' text: [ :job | job name ]
]

{ #category : #accessing }
WEWorkflow >> gtWorkflowNameFor: aView [
	<gtView>
	^ aView forward
		title: 'Name';
		priority: 20;
		object: [ self name asString ]
]

{ #category : #initialization }
WEWorkflow >> initializeEvents [
	| eventDictionary |
	eventDictionary := data at: 'on' ifAbsent: [ '' ].
	(eventDictionary isKindOf: ArrayedCollection)
		ifTrue: [ events := OrderedCollection new ]
		ifFalse: [ events := (data at: 'on' ) associations
					collect: [ :asoc | 
						WEEvent new
							name: asoc key;
							data: asoc value ] ]
]

{ #category : #initialization }
WEWorkflow >> initializeJobs [
	| jobDictionary |
	jobDictionary := data at: 'jobs' ifAbsent: [''].
	(jobDictionary isKindOf: String)
		ifTrue: [ jobs := OrderedCollection new ]
		ifFalse: [ jobs := (data at: 'jobs') associations
					collect: [ :asoc | 
						WEJob new
							name: asoc key;
							data: asoc value ] ]
]

{ #category : #accessing }
WEWorkflow >> jobs [
	^ jobs
]
