Class {
	#name : #WEModelEntity,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#category : #'Egad-Model'
}

{ #category : #accessing }
WEModelEntity >> data [

	^ data
]

{ #category : #accessing }
WEModelEntity >> data: dictionary [ 

	data:= dictionary ifNil: [Dictionary new]
]

{ #category : #accessing }
WEModelEntity >> gtJSONFor: aView [
	<gtView>
	^ aView forward
		title: 'JSON data';
		priority: 20;
		object: [ data ];
		view: #gtItemsFor:
]
