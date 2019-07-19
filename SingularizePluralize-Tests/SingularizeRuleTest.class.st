Class {
	#name : #SingularizeRuleTest,
	#superclass : #TestCase,
	#instVars : [
		'rule'
	],
	#category : #'SingularizePluralize-Tests'
}

{ #category : #running }
SingularizeRuleTest >> setUp [
	super setUp.
	rule := SingularizeRule
		match: '[ml]ice'
		removeEnding: 'ice\>'
		addEnding: 'ouse'.
]

{ #category : #tests }
SingularizeRuleTest >> testDoesNotMatchBanana [
	self assert: (rule matches: 'banana') not
]

{ #category : #tests }
SingularizeRuleTest >> testMatchesLice [
	self assert: (rule matches: 'lice')
]

{ #category : #tests }
SingularizeRuleTest >> testMatchesMice [
	self assert: (rule matches: 'mice')
]

{ #category : #tests }
SingularizeRuleTest >> testSingularizeLice [
	self assert: (rule singularize: 'lice') equals: 'louse'
]

{ #category : #tests }
SingularizeRuleTest >> testSingularizeMice [
	self assert: (rule singularize: 'mice') equals: 'mouse'
]
