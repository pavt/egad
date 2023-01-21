Class {
	#name : #WENamedEntity,
	#superclass : #WEModelEntity,
	#instVars : [
		'name'
	],
	#category : #Egad
}

{ #category : #accessing }
WENamedEntity >> name [

	^ name
]

{ #category : #accessing }
WENamedEntity >> name: aString [

	name:= aString
]

{ #category : #accessing }
WENamedEntity >> printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: '(', self name,')'
]
