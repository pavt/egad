Class {
	#name : #BaselineOfEgad,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtStuff
}

{ #category : #accessing }
BaselineOfEgad class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'pavt' / 'gt-stuff'
				/ 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfEgad >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'GtStuff' ]
]
