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
	^ histories
]
