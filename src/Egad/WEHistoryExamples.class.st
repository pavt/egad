Class {
	#name : #WEHistoryExamples,
	#superclass : #Object,
	#category : #'Egad-Example'
}

{ #category : #accessing }
WEHistoryExamples >> docsYMLHistoryExample [
	<gtExample>
	| history |
	history := WEHistory fromRepoPath: '../fastai' forYML: 'docs.yml' .
	self assert: history workflowCommits size equals: 112.
	self assert: history stickyCommits size equals: 12.
	^ history
]
