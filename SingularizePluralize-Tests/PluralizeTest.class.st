Class {
	#name : #PluralizeTest,
	#superclass : #TestCase,
	#category : #'SingularizePluralize-Tests'
}

{ #category : #tests }
PluralizeTest >> testPluralOfBanana [
	self assert: 'banana' asPlural equals: 'bananas'
]

{ #category : #tests }
PluralizeTest >> testPluralOfFriend [
	self assert: 'friend' asPlural equals: 'friends'
]
