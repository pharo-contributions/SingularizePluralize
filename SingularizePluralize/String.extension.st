Extension { #name : #String }

{ #category : #'*SingularizePluralize' }
String >> asPlural [
	"Convert a noun to its plural form"
	| rule |
	rule := self pluralizeRules detect: [ :r | r matches: self ].
	^ rule pluralize: self
]

{ #category : #'*SingularizePluralize' }
String >> asSingular [
	"Convert a noun to its singular form"
	self shouldBeImplemented
]

{ #category : #'*SingularizePluralize' }
String >> pluralizeRules [
	^ { 
		PluralizeRule
			match: '.*quiz\>'
			removeEnding: ''
			addEnding: 'zes' .
			
		PluralizeRule
			match: '.*oxen\>'
			removeEnding: ''
			addEnding: '' .
			
		PluralizeRule
			match: '.*ox\>'
			removeEnding: ''
			addEnding: 'en' .
			
		PluralizeRule
			match: '.*[ml]ice\>'
			removeEnding: ''
			addEnding: '' .
			
		PluralizeRule 
			match: '.*[ml]ouse\>'
			removeEnding: 'ouse\>'
			addEnding: 'ice' .
			
		PluralizeRule
			match: '.*(matr|vert|ind)(ix|ex)\>'
			removeEnding: '(ix|ex)\>'
			addEnding: 'ices' .
			
		PluralizeRule 
			match: '.*(x|ch|ss|sh)\>'
			removeEnding: ''
			addEnding: 'es' .
			
		PluralizeRule 
			match: '.*([^aeiouy]|qu)y\>'
			removeEnding: 'y\>'
			addEnding: 'ies' .
			
		PluralizeRule 
			match: '.*hive\>'
			removeEnding: ''
			addEnding: 's' .
			
		PluralizeRule 
			match: '.*[lr]f\>'
			removeEnding: 'f\>'
			addEnding: 'ves' .
			
		PluralizeRule 
			match: '.*[^f]fe\>'
			removeEnding: 'fe\>'
			addEnding: 'ves' .
			
		PluralizeRule 
			match: '.*sis\>'
			removeEnding: 'sis\>'
			addEnding: 'ses' .
			
		PluralizeRule 
			match: '.*[ti]a\>'
			removeEnding: ''
			addEnding: '' .
			
		PluralizeRule 
			match: '.*[ti]um\>'
			removeEnding: 'um\>'
			addEnding: 'a' .
			
		PluralizeRule 
			match: '.*(buffal|potat|tomat)o\>'
			removeEnding: ''
			addEnding: 'es' .
			
		PluralizeRule
			match: '.*bus\>'
			removeEnding: ''
			addEnding: 'es' .
	}
]

{ #category : #'*SingularizePluralize' }
String >> uncountables [
	^ #(
	equipment
	fish
	information
	jeans
	money
	rice
	series
	sheep
	species).
]
