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

{ #category : #accessing }
WEHistoryExamples >> pythonPackageExample [
	<gtExample>
	| history |
	history := WEHistory fromRepoPath: '6-repositories/rich' forYML: 'pythonpackage.yml'.
	^ history
]
