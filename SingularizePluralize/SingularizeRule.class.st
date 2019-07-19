Class {
	#name : #SingularizeRule,
	#superclass : #SingularizePluralizeRule,
	#category : #SingularizePluralize
}

{ #category : #'as yet unclassified' }
SingularizeRule >> singularize: aWord [
	^ self transform: aWord
]
