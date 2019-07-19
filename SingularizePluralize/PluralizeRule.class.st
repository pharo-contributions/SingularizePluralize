Class {
	#name : #PluralizeRule,
	#superclass : #SingularizePluralizeRule,
	#category : #SingularizePluralize
}

{ #category : #'as yet unclassified' }
PluralizeRule >> pluralize: aWord [
	^ self transform: aWord
]
