Class {
	#name : #PluralizeRuleTest,
	#superclass : #TestCase,
	#instVars : [
		'rule'
	],
	#category : #'SingularizePluralize-Tests'
}

{ #category : #running }
PluralizeRuleTest >> setUp [
	super setUp.
	rule := PluralizeRule
		match: '[ml]ouse'
		removeEnding: 'ouse\>'
		addEnding: 'ice'.
]

{ #category : #running }
PluralizeRuleTest >> testDoesNotMatchHouse [
	self assert: (rule matches: 'house') not
]

{ #category : #running }
PluralizeRuleTest >> testMatchesLouse [
	self assert: (rule matches: 'louse')
]

{ #category : #running }
PluralizeRuleTest >> testMatchesMouse [
	self assert: (rule matches: 'mouse')
]

{ #category : #running }
PluralizeRuleTest >> testPluralizeLouse [
	self assert: (rule pluralize: 'louse') equals: 'lice'
]

{ #category : #running }
PluralizeRuleTest >> testPluralizeMouse [
	self assert: (rule pluralize: 'mouse') equals: 'mice'
]
