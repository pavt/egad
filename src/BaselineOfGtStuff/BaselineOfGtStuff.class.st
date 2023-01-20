Class {
	#name : #BaselineOfGtStuff,
	#superclass : #BaselineOf,
	#category : #BaselineOfGtStuff
}

{ #category : #accessing }
BaselineOfGtStuff class >> loadLepiter [
	| currentProperties |
	currentProperties := LeDatabasesRegistry defaultLogicalDatabase properties.
	currentProperties
		addRegisteredDirectory: FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'pavt' / 'gt-stuff'
				/ 'lepiter'.
	LeDatabasesRegistry default defaultLogicalDatabase reload
]

{ #category : #baseline }
BaselineOfGtStuff >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'GtStuff' ]
]
