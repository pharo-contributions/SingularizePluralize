Class {
	#name : #SingularizeTest,
	#superclass : #TestCase,
	#category : #'SingularizePluralize-Tests'
}

{ #category : #tests }
SingularizeTest >> testSingularOfBananas [
	self assert: 'bananas' asSingular equals: 'banana'
]

{ #category : #tests }
SingularizeTest >> testSingularOfFriends [
	self assert: 'friends' asSingular equals: 'friend'
]
