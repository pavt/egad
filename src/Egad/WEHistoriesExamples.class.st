Class {
	#name : #WEHistoriesExamples,
	#superclass : #Object,
	#category : #'Egad-Example'
}

{ #category : #accessing }
WEHistoriesExamples >> historiesExample [
	<gtExample>
	| histories |
	
	histories := WEHistories fromReposPath: '../repositories'.
	self assert: (histories histories size) equals: 315.
	
	^ histories
]
