Class {
	#name : #Egad,
	#superclass : #Object,
	#category : #'Egad-Datasets'
}

{ #category : #accessing }
Egad >> install6repos [
	<gtExample>
	<noTest>
	| zipFile extracted |
	zipFile := 'pharo-local/iceberg/pavt/egad/dataset/6-repositories.zip'
			asFileReference.
	extracted := FileLocator workingDirectory / zipFile basenameWithoutExtension.
	extracted ensureCreateDirectory.
	ZipArchive new
		readFrom: zipFile fullName;
		extractAllTo: extracted overwrite: true;
		close.
	^ extracted
]
