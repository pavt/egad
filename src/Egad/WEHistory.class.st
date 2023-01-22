"
The class `WEHistory` implement the history of a Github Action workflow.

*Responsibility*: (i) keep a collection of all the versions of a workflow file; (ii) initialize the history of a workflow.

An example of a WEHistory is: 

```
| history |
	history := WEHistory fromRepoPath: '../fastai' forYML: 'docs.yml' .
	self assert: history workflowCommits size equals: 112.
	self assert: history stickyCommits size equals: 12.
	^ history

```



 


"
Class {
	#name : #WEHistory,
	#superclass : #Object,
	#instVars : [
		'ymlFile',
		'repoPath',
		'repo',
		'ymlFilePath',
		'stickyCommits',
		'stickyGroups',
		'workflowCommits',
		'timeBudget',
		'lastTime'
	],
	#category : #'Egad-Model'
}

{ #category : #accessing }
WEHistory class >> fromRepoPath: aPathString forYML: aFilename [
	^ self new repoPath: aPathString ; 
		   ymlFile: aFilename
]

{ #category : #accessing }
WEHistory class >> fromReposPath: aPathString [
	self error: 'Use WEHistories>>#fromReposPath: instead'
]

{ #category : #'git support' }
WEHistory >> allCommits [
	"These are all commits, not just those to the workflow file"

	^ self branch commits
]

{ #category : #scheduling }
WEHistory >> beNice [
	Time now asDuration - lastTime > self timeBudget
		ifTrue: [ Processor yield.
			self resetClock ]
]

{ #category : #'git support' }
WEHistory >> branch [
	^ repo localBranches
		detect: [ :b | 
			b name = 'main'
				or: [ b name = 'master'
						or: [ b name = 'development' or: [ b name = 'develop' or: [ b name = 'canary' ] ] ] ] ]
]

{ #category : #'git support' }
WEHistory >> commitsByAuthor [
	| commitsByAuthor authorCommits previousAuthor commits |
	previousAuthor := ''.
	commitsByAuthor := OrderedCollection new.
	authorCommits := OrderedCollection new.
	commitsByAuthor add: authorCommits.
	commits := self workflowCommits.
	commits allButLast
		withIndexDo: [ :element :index | 
			authorCommits add: element.
			element author = (commits at: index + 1) author
				ifFalse: [ authorCommits := OrderedCollection new.
					commitsByAuthor add: authorCommits ] ].
	authorCommits add: commits last.
	^ commitsByAuthor
]

{ #category : #constants }
WEHistory >> defaultTimeBudget [
	^ 100 milliseconds
]

{ #category : #ui }
WEHistory >> delta: commit [
	^ commit commit datetime - commit previousFileCommit commit datetime
]

{ #category : #accessing }
WEHistory >> editableLabelFor: aString withSetter: aOneArgumentBlock [
	"NB: stateless utility method"

	| label |
	label := BrEditableLabel new
		aptitude: (BrGlamorousEditableLabelAptitude new defaultBackground: Color white);
		text: aString.
	label
		when: BrEditorAcceptWish
		do: [ :aWish | 
			aString ~= aWish text asString
				ifTrue: [ [ aOneArgumentBlock value: aWish text asString ]
						on: AssertionFailure
						do: [ :e | 
							label text: aString.
							self inform: e printString ] ] ].
	^ label
]

{ #category : #ui }
WEHistory >> gtCommitsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Commits';
		priority: 30;
		items: [ self workflowCommits reversed	"sort: [ :a :b | a commit datetime < b commit datetime]" ];
		column: 'Index'
			text: [ :eachItem :eachIndex | eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Author'
			text: [ :commit | commit commit author ]
			width: 130;
		column: 'Timestamp'
			text: [ :commit | commit commit datetime year ]
			width: 70;
		column: 'Delta'
			text: [ :commit | 
				commit hasPreviousFileCommit
					ifTrue: [ (self delta: commit) asString ]
					ifFalse: [ 'na' ] ]
			width: 100;
		column: 'Comment'
			text: [ :commit | commit commit comment ]
			width: 400;
		column: 'Category'
			do: [ :column | 
				column
					stencil: [ :commit | 
						self
							editableLabelFor: commit category
							withSetter: [ :newCategoryName | commit category: newCategoryName ] ];
					weight: 1 ]
]

{ #category : #ui }
WEHistory >> gtStickyCommitsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Sticky Groups';
		priority: 70;
		items: [ self stickyCommits reversed];
		column: 'Index' 
			text: [ :eachItem :eachIndex | 
				eachIndex asRopedText foreground: Color gray ]
			width: 45;
		column: 'Author' text: [ :each | each stickyGroup first commit author ];
		column: 'Start' text: [ :each | each stickyGroup first commit datetime asString ];
		column: 'End' text: [ :each | each stickyGroup last commit datetime asString ];
		column: 'Number of commits' text: [ :each | each stickyGroup size asString ]
]

{ #category : #ui }
WEHistory >> gtWorkflowDirFor: aView [
	<gtView>
	^ aView forward
		title: 'Workflows';
		priority: 10;
		object: [ self workflowDir ];
		view: #gtItemsFor:
]

{ #category : #accessing }
WEHistory >> historyIdsAndCategories [
	"We use these in the storeOn: method to recreate the workflowcommits from the ids and the categories."

	^ self workflowCommits collect: [ :each | each commit id -> each category ]
]

{ #category : #initialization }
WEHistory >> initialize [
	self timeBudget: self defaultTimeBudget
]

{ #category : #initialization }
WEHistory >> initializeRepo [
	repo := IceRepository registry
			detect: [ :repository | repository location = self location ]
			ifNone: [ (IceRepositoryCreator new
					location: self location;
					createRepository)
					name;
					register ]
]

{ #category : #initialization }
WEHistory >> initializeStickyGroups [
	| stickyCandidate previousAuthor commits candidates |
	previousAuthor := ''.
	candidates := OrderedCollection new.
	stickyCandidate := OrderedCollection new.
	candidates add: stickyCandidate.
	commits := self workflowCommits.
	commits allButLast
		withIndexDo: [ :element :index | 
			| nextElement |
			stickyCandidate add: element.
			nextElement := commits at: index + 1.
			(element commit author ~= nextElement commit author
			 "here we are considering the time diff between 2 commits in the filtering process" 
				"or: [ element datetime - nextElement datetime > self maxStickyDuration ]")
				ifTrue: [ stickyCandidate := OrderedCollection new.
					candidates add: stickyCandidate ] ].
	stickyCandidate add: commits last.
	stickyGroups := (candidates select: [ :each | each size > 1 ])
			collect: [ :each | WEStickyGroup forFileCommit: each ]
]

{ #category : #initialization }
WEHistory >> initializeWorkflowCommits [
	| commitWalk thisCommit lastCommit |
	workflowCommits := OrderedCollection new.
	commitWalk := self branch newCommitWalk.
	commitWalk revwalk
		select: [ :aLGitCommit | aLGitCommit changesFileNamed: self ymlFilePath fullName ]
		thenDo: [ :aLGitCommit | 
			thisCommit := WEFileCommit new
					commit: (commitWalk commitFrom: aLGitCommit);
					file: self ymlFile.
			workflowCommits add: thisCommit.
			lastCommit ifNotNil: [ lastCommit previousFileCommit: thisCommit ].
			lastCommit := thisCommit ]
]

{ #category : #initialization }
WEHistory >> initializeWorkflowCommitsFromIds: anIdCollection [
	| lastCommit |
	workflowCommits := anIdCollection
			collect: [ :assoc | 
				| iceCommit weCommit |
				iceCommit := self repository
						commitFromGitCommit: (LGitCommit
								of: self repository repositoryHandle
								fromId: (LGitId fromHexString: assoc key)).
				weCommit := WEFileCommit new
						commit: iceCommit;
						file: self ymlFile.
				weCommit category: assoc value.
				lastCommit ifNotNil: [ lastCommit previousFileCommit: weCommit ].
				lastCommit := weCommit ]
]

{ #category : #accessing }
WEHistory >> initializeWorkflowCommitsNicely [
	"This version does a Processor yield after a certain delay"

	| commitWalk thisCommit lastCommit |
	self resetClock.

	workflowCommits := OrderedCollection new.
	commitWalk := self branch newCommitWalk.
	commitWalk revwalk
		select: [ :aLGitCommit | aLGitCommit changesFileNamed: self ymlFilePath fullName ]
		thenDo: [ :aLGitCommit | 
			self beNice.
			"1 second asDelay wait."
			thisCommit := WEFileCommit new
					commit: (commitWalk commitFrom: aLGitCommit);
					file: self ymlFile.
			workflowCommits add: thisCommit.
			lastCommit ifNotNil: [ lastCommit previousFileCommit: thisCommit ].
			lastCommit := thisCommit ]
]

{ #category : #accessing }
WEHistory >> location [
	^ self repoPath asFileReference
]

{ #category : #accessing }
WEHistory >> maxStickyDuration [
	"max duration is 20 minutes"
	^ Duration minutes: 20
]

{ #category : #accessing }
WEHistory >> printOn: aStream [
	 
		
	aStream
		nextPutAll: self className;
		nextPutAll: ' REPO: ';
		nextPutAll: self repoPath  ;
		nextPutAll: ' YML: ';
		nextPutAll: self ymlFile 
		
]

{ #category : #accessing }
WEHistory >> repoPath [
	^ repoPath
]

{ #category : #accessing }
WEHistory >> repoPath: aPathString [
	repoPath := aPathString.
	self initializeRepo
]

{ #category : #initialization }
WEHistory >> repository [
	repo ifNil: [ self initializeRepo ].
	^ repo
]

{ #category : #accessing }
WEHistory >> resetClock [
	lastTime := Time now asDuration
]

{ #category : #accessing }
WEHistory >> stickyCommits [
	stickyGroups ifNil: [self initializeStickyGroups].
	^ stickyGroups
]

{ #category : #accessing }
WEHistory >> storeOn: aStream [
	aStream
		nextPutAll: '(';
		nextPutAll: self className;
		nextPutAll: ' fromRepoPath: ';
		nextPutAll: self repoPath storeString;
		nextPutAll: ' forYML: ';
		nextPutAll: self ymlFile storeString;
		nextPutAll: ') initializeWorkflowCommitsFromIds: ';
		nextPutAll: self historyIdsAndCategories storeString
]

{ #category : #accessing }
WEHistory >> timeBudget [

	^ timeBudget
]

{ #category : #accessing }
WEHistory >> timeBudget: aDuration [
	timeBudget := aDuration
]

{ #category : #accessing }
WEHistory >> workflowCommits [
	workflowCommits ifNil: [ self initializeWorkflowCommitsNicely ].
	^ workflowCommits 
]

{ #category : #accessing }
WEHistory >> workflowDir [
	^ repo repositoryDirectory / '.github' / 'workflows'
]

{ #category : #accessing }
WEHistory >> ymlFile [
	^ ymlFile
]

{ #category : #accessing }
WEHistory >> ymlFile: aFilename [
	ymlFile := aFilename
]

{ #category : #accessing }
WEHistory >> ymlFilePath [
	"This is the path to the workflow file in any given repo with github actions"

	^ Path from: '.github/workflows/', self ymlFile
]

{ #category : #accessing }
WEHistory >> ymlFilePath: anObject [

	ymlFilePath := anObject
]
