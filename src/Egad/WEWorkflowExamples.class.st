Class {
	#name : #WEWorkflowExamples,
	#superclass : #Object,
	#category : #Egad
}

{ #category : #accessing }
WEWorkflowExamples >> ciExample [
	<gtExample>
	| workflow |
	workflow := OldWEWorkflow forExample: 'ci'.
	self assert: workflow name equals: 'CI'.
	self assert: workflow events size equals: 1.
	self assert: workflow jobs size equals: 4.
	^ workflow
]

{ #category : #accessing }
WEWorkflowExamples >> collectionOfWorkflowsExample [
	<gtExample>
	| examples jsonFiles collectionOfWorkflows |
	examples := FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'pavt'
			/ 'workflow-evolution' / 'workflow_examples'.
	jsonFiles := examples asFileReference allChildrenMatching: '*.json'.
	collectionOfWorkflows := jsonFiles
			collect: [ :file | WEWorkflow new data: (STON fromString: file contents) ].
	^ collectionOfWorkflows
]

{ #category : #accessing }
WEWorkflowExamples >> visualizeWEWorkflowDiagramExample [
	<gtExample>
	| workflow |
	workflow := OldWEWorkflow forExample: 'visualizeClassDiagram'.
	self assert: workflow name equals: 'UML Class diagram'.
	self assert: workflow events size equals: 3.
	self assert: workflow jobs size equals: 1.
	^ workflow
]

{ #category : #accessing }
WEWorkflowExamples >> workflowExample [
	<gtExample>
	
	"In this example we build a WEWorkflow considering workflows files"
	
	| examples jsonFiles collectionOfJsonFiles weWorkflow |
	
	"All the files are in the next path"
	examples := FileLocator imageDirectory / 'pharo-local' / 'iceberg' / 'pavt'
			/ 'workflow-evolution' / 'workflow_examples'.			
	jsonFiles := examples asFileReference allChildrenMatching: '*.json'.
	collectionOfJsonFiles:= jsonFiles collect: [ :file | WEWorkflow new data: (STON fromString: file contents) ].
	
	"Here we consider the fifth file, but you can try others."
	weWorkflow:= WEWorkflow fromFile: jsonFiles fifth.
	
	^ weWorkflow
	
]
