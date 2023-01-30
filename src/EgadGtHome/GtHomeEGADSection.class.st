Class {
	#name : #GtHomeEGADSection,
	#superclass : #GtHomeSection,
	#category : #'EgadGtHome-Sections'
}

{ #category : #accessing }
GtHomeEGADSection >> create [
	| sectionContainer cardsContainer |
	sectionContainer := self newSectionContainer.
	sectionContainer addChild: (self newSectionTitle: 'Get started').
	cardsContainer := self newCardsContainer.
		
	cardsContainer addChild: (self
		newHeaderCardWithTitle: 'EGAD'
		description: 'Get started with the EGAD demo'
		size: 200@150
		content:
			(BrLabel new
				text: 'Get started with EGAD';
				aptitude: BrGlamorousLabelAptitude new
					bold;
				padding: (BlInsets all: 20)) asScalableElement
		action: [ :card | 
			| database startPage |
			database := LeDatabasesRegistry default currentLoadedDefaultLogicalDatabase 
				databaseNamed: 'Egad Notebook'.
			startPage := database pageNamed: 'Get started with EGAD'.
			GtWorldUtility 
				showSpaceWithTitle: startPage title
				inPagerWith: [ startPage
					asLepiterPagePhlowTool asElementDo: [ :e | e ] ] asStencil
				from: card ]).
			
	sectionContainer addChild: cardsContainer.
	^ sectionContainer
]
