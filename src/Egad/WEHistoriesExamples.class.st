Class {
	#name : #WEHistoriesExamples,
	#superclass : #Object,
	#category : #'Egad-Example'
}

{ #category : #accessing }
WEHistoriesExamples >> StickyGroupExample [
	<gtExample>
	| repositories50 historiesList workflowsNamedTest thirdGroup |
	repositories50 := FileLocator imageDirectory  / '50-repositories'.
	historiesList := WEHistories fromReposPath: repositories50.
	workflowsNamedTest := historiesList histories select: [ :each | each ymlFile = 'test.yml'].
	thirdGroup := workflowsNamedTest third.
	^ thirdGroup stickyCommits at: 20
]

{ #category : #accessing }
WEHistoriesExamples >> historiesExample [
	<gtExample>
	| histories |
	histories := WEHistories fromReposPath: '../repositories'.
	^ histories
]

{ #category : #accessing }
WEHistoriesExamples >> historiesFrom50RepositoriesExample [
	<gtExample>
	| repositories50 historiesList |
	repositories50 := FileLocator imageDirectory  / '50-repositories'.
	historiesList := WEHistories fromReposPath: repositories50.
	^ historiesList
]

{ #category : #accessing }
WEHistoriesExamples >> historiesOpenBBTerminalExample [
	<gtExample>
	| repositories50 historiesList workflowsNamedTest |
	repositories50 := FileLocator imageDirectory  / '50-repositories'.
	historiesList := WEHistories fromReposPath: repositories50.
	workflowsNamedTest := historiesList histories select: [ :each | each ymlFile = 'test.yml'].
	^ workflowsNamedTest third
]
