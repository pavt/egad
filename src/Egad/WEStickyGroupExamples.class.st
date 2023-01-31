Class {
	#name : #WEStickyGroupExamples,
	#superclass : #Object,
	#category : #'Egad-Example'
}

{ #category : #accessing }
WEStickyGroupExamples >> stickyGroupExample [
<gtExample>
	| history stickyCommits |
	history := WEHistory fromRepoPath: '6-repositories/rich' forYML: 'pythonpackage.yml'.
	stickyCommits:= history stickyCommits last.
	^ stickyCommits
]
