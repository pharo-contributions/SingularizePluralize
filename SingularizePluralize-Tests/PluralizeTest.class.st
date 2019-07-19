Class {
	#name : #PluralizeTest,
	#superclass : #TestCase,
	#category : #'SingularizePluralize-Tests'
}

{ #category : #tests }
PluralizeTest >> testPluralOfAxis [
	self assert: 'axis' asPlural equals: 'axes'
]

{ #category : #tests }
PluralizeTest >> testPluralOfBanana [
	self assert: 'banana' asPlural equals: 'bananas'
]

{ #category : #tests }
PluralizeTest >> testPluralOfChild [
	self assert: 'child' asPlural equals: 'children'
]

{ #category : #tests }
PluralizeTest >> testPluralOfFriend [
	self assert: 'friend' asPlural equals: 'friends'
]

{ #category : #tests }
PluralizeTest >> testPluralOfMatrix [
	self assert: 'matrix' asPlural equals: 'matrices'
]
