Class {
	#name : #Egad,
	#superclass : #Object,
	#category : #'Egad-Datasets'
}

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
Egad >> install6repos [
	"Create and install the 6repos folder if necessary.
If the 6 repos are not there yet, unzip them from the zip file."

	<gtExample>
	<noTest>
	| reposFolder |
	reposFolder := self the6reposFolder.
	reposFolder ensureCreateDirectory.
	(self gitChildrenNamesIn: reposFolder) = self the6reposNames
		ifFalse: [ ZipArchive new
				readFrom: self the6reposZipFile fullName;
				extractAllTo: reposFolder overwrite: true;
				close ].
	self assert: (self gitChildrenNamesIn: reposFolder) equals: self the6reposNames.
	^ reposFolder
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
	^ FileLocator workingDirectory / self the6reposZipFile basenameWithoutExtension
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
