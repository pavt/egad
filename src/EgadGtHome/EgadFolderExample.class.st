Class {
	#name : #EgadFolderExample,
	#superclass : #Object,
	#category : #'EgadGtHome-Examples'
}

{ #category : #accessing }
EgadFolderExample >> parentFolder [
	<gtExample>
	<noTest>
	^ '..' asFileReference
]
