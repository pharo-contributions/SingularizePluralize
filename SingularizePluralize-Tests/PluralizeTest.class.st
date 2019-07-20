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
PluralizeTest >> testPluralOfIndex [
	self assert: 'index' asPlural equals: 'indices'
]

{ #category : #tests }
PluralizeTest >> testPluralOfLice [
	self assert: 'lice' asPlural equals: 'lice'
]

{ #category : #tests }
PluralizeTest >> testPluralOfLouse [
	self assert: 'louse' asPlural equals: 'lice'
]

{ #category : #tests }
PluralizeTest >> testPluralOfMatrix [
	self assert: 'matrix' asPlural equals: 'matrices'
]

{ #category : #tests }
PluralizeTest >> testPluralOfMice [
	self assert: 'mice' asPlural equals: 'mice'
]

{ #category : #tests }
PluralizeTest >> testPluralOfMouse [
	self assert: 'mouse' asPlural equals: 'mice'
]

{ #category : #tests }
PluralizeTest >> testPluralOfOx [
	self assert: 'ox' asPlural equals: 'oxen'
]

{ #category : #tests }
PluralizeTest >> testPluralOfOxen [
	self assert: 'oxen' asPlural equals: 'oxen'
]

{ #category : #tests }
PluralizeTest >> testPluralOfQuiz [
	self assert: 'quiz' asPlural equals: 'quizzes'
]

{ #category : #tests }
PluralizeTest >> testPluralOfVertex [
	self assert: 'vertex' asPlural equals: 'vertices'
]
