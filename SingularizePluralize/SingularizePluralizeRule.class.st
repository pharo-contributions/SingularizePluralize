Class {
	#name : #SingularizePluralizeRule,
	#superclass : #Object,
	#instVars : [
		'matchRegex',
		'oldEndingRegex',
		'newEnding'
	],
	#category : #SingularizePluralize
}

{ #category : #'as yet unclassified' }
SingularizePluralizeRule class >> match: aMatch addEnding: aNewEnding [
	^ self new initializeMatch: aMatch removeEnding: '' addEnding: aNewEnding
]

{ #category : #'as yet unclassified' }
SingularizePluralizeRule class >> match: aMatch removeEnding: anOldEnding [
	^ self new initializeMatch: aMatch removeEnding: anOldEnding addEnding: ''
]

{ #category : #'as yet unclassified' }
SingularizePluralizeRule class >> match: aMatch removeEnding: anOldEnding addEnding: aNewEnding [
	^ self new initializeMatch: aMatch removeEnding: anOldEnding addEnding: aNewEnding
]

{ #category : #'as yet unclassified' }
SingularizePluralizeRule class >> matchDoNothing: aMatch [
	^ self new initializeMatch: aMatch removeEnding: '' addEnding: ''
]

{ #category : #initialization }
SingularizePluralizeRule >> initializeMatch: aMatchRegex removeEnding: anOldEndingRegex addEnding: aNewEnding [
	matchRegex := aMatchRegex asRegex.
	oldEndingRegex := anOldEndingRegex asRegex.
	newEnding := aNewEnding.
]

{ #category : #testing }
SingularizePluralizeRule >> matches: aWord [
	^ matchRegex matches: aWord
]

{ #category : #testing }
SingularizePluralizeRule >> transform: aWord [
	^ oldEndingRegex copy: aWord replacingMatchesWith: newEnding
]
