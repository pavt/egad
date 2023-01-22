"
The class `WEStep` implement the step of the jobs of a Github Action workflow.
"
Class {
	#name : #WEStep,
	#superclass : #WEModelEntity,
	#category : #'Egad-Model'
}

{ #category : #accessing }
WEStep >> getField: fieldName [
	^ (self data at: fieldName ifAbsent: [''])
]

{ #category : #accessing }
WEStep >> name [
	^ (self getField: 'name')
]

{ #category : #accessing }
WEStep >> uses [
	^ (self getField: 'uses')
]

{ #category : #accessing }
WEStep >> with [
	^ (self getField: 'with')
]
