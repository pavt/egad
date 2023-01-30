Class {
	#name : #Egad,
	#superclass : #Object,
	#category : #'Egad-Datasets'
}

{ #category : #accessing }
Egad >> clone50repos [
	"Actually clone 50 repos. This can take about ten minutes with a fast data connection."

	| repos datasetFolder |
	repos := self the50reposNames.
	datasetFolder := self the50reposFolder.

	[ [ :job | 
	job title: '50 repositories'.
	repos
		doWithIndex: [ :each :n | 
			| proc |
			job
				progress: n / repos size;
				title: 'Loading ' , each printString.
			proc := GtSubprocessWithInMemoryOutput new
					workingDirectory: datasetFolder;
					command: 'git';
					arguments: {'clone'.
							each};
					errorBlock: [ :theProc | self error: 'Git clone failed, see proc' ].
			proc runAndWait.
			(Delay forMilliseconds: 100) wait ] ] asJob run ] fork.
	datasetFolder
]

{ #category : #accessing }
Egad >> gitChildrenNamesIn: aFolder [
	"Extract from a folder the names of the subfolders that are git repos."

	^ ((aFolder children
		select: [ :each | 
			each isDirectory
				and: [ (each / '.git') exists and: [ (each / '.git') isDirectory ] ] ])
		collect: #basename) asSet
]

{ #category : #accessing }
Egad >> install50repos [
	"Create and install the 6repos folder if necessary.
If the 50 repos are not there yet, unzip them from the zip file."

	<gtExample>
	<noTest>
	| reposFolder |
	reposFolder := self the50reposFolder.
	(self gitChildrenNamesIn: reposFolder) = self the50reposNames
		ifFalse: [ self clone50repos ].
	self
		assert: (self gitChildrenNamesIn: reposFolder)
		equals: self the50reposNames.
	^ reposFolder
]

{ #category : #accessing }
Egad >> install6repos [
	"Create and install the 6repos folder if necessary.
If the 6 repos are not there yet, unzip them from the zip file."

	<gtExample>
	<noTest>
	| reposFolder |
	reposFolder := self the6reposFolder.
	(self gitChildrenNamesIn: reposFolder) = self the6reposNames
		ifFalse: [ ZipArchive new
				readFrom: self the6reposZipFile fullName;
				extractAllTo: reposFolder overwrite: true;
				close ].
	self assert: (self gitChildrenNamesIn: reposFolder) equals: self the6reposNames.
	^ reposFolder
]

{ #category : #accessing }
Egad >> the50ReposScriptFolder [
	<gtExample>
	<noTest>
	^ self the50ReposScriptFolderName asFileReference
]

{ #category : #accessing }
Egad >> the50ReposScriptFolderName [
	<gtExample>
	^ 'pharo-local/iceberg/pavt/egad/dataset/script'
]

{ #category : #accessing }
Egad >> the50reposFolder [
	<gtExample>
	<noTest>
	| reposFolder |
	reposFolder := FileLocator workingDirectory / '50-repositories'.
	reposFolder ensureCreateDirectory.
	{'clone_all.sh'.
		'repos.txt'}
		do: [ :each | 
			(reposFolder / each) exists
				ifFalse: [ self the50ReposScriptFolder / each copyTo: reposFolder / each ] ].
	^ reposFolder
]

{ #category : #accessing }
Egad >> the50reposFolderNames [
	"Just the folder names that will be cloned"
	<gtExample>
	<noTest>
	^ (self the50reposNames
		collect: [ :each | (each copyAfter: $/) copyUpToSubstring: '.git' ]) asSet
]

{ #category : #accessing }
Egad >> the50reposNames [
	"The full repo names to clone"
	<gtExample>
	<noTest>
	^ (Character lf split: (self the50reposFolder / 'repos.txt') contents)
		select: #notEmpty
]

{ #category : #accessing }
Egad >> the6ReposZipFilename [
	<gtExample>
	^ 'pharo-local/iceberg/pavt/egad/dataset/6-repositories.zip'
]

{ #category : #accessing }
Egad >> the6reposFolder [
	<gtExample>
	<noTest>
	| reposFolder |
	reposFolder := FileLocator workingDirectory
			/ self the6reposZipFile basenameWithoutExtension.
	reposFolder ensureCreateDirectory.
	^ reposFolder
]

{ #category : #accessing }
Egad >> the6reposNames [
	<gtExample>
	^ #('alist' 'bubbletea' 'type-challenges' 'github-readme-stats' 'rich' 'glow')
		asSet
]

{ #category : #accessing }
Egad >> the6reposZipFile [
	<gtExample>
	<noTest>
	^ self the6ReposZipFilename asFileReference
]
