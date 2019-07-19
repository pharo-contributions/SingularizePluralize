Extension { #name : #String }

{ #category : #'*SingularizePluralize' }
String >> asPlural [
	"Convert a noun to its plural form"
	| rule |
	
	(self uncountableNouns includes: self) ifTrue: [ ^ self ].
	(self irregularNouns keys includes: self) ifTrue: [ ^ self irregularNouns at: self ].
	
	rule := self pluralizeRules detect: [ :r | r matches: self ].
	^ rule pluralize: self
]

{ #category : #'*SingularizePluralize' }
String >> asSingular [
	"Convert a noun to its singular form"
	self shouldBeImplemented
]

{ #category : #'*SingularizePluralize' }
String >> irregularNouns [
	^ {
		'person' -> 'people' .
		'man' -> 'men' .
		'human' -> 'humans' .
		'child' -> 'children' .
		'sex' -> 'sexes' .
		'move' -> 'moves' .
		'cow' -> 'kine' .
		'zombie' -> 'zombies'
	} asDictionary.
]

{ #category : #'*SingularizePluralize' }
String >> pluralizeRules [
	^ { 
		PluralizeRule
			match: '.*quiz\>'
			removeEnding: ''
			addEnding: 'zes' .
			
		PluralizeRule
			match: 'oxen\>'
			removeEnding: ''
			addEnding: '' .
			
		PluralizeRule
			match: 'ox\>'
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
			
		PluralizeRule 
			match: '.*(alias|status)\>'
			removeEnding: ''
			addEnding: 'es' .
			
		PluralizeRule 
			match: '.*(octop|vir)i\>'
			removeEnding: ''
			addEnding: '' .
			
		PluralizeRule
			match: '.*(octop|vir)us\>'
			removeEnding: 'us\>'
			addEnding: 'i' .
			
		PluralizeRule 
			match: '(ax|test)is\>'
			removeEnding: 'is\>'
			addEnding: 'es' .
			
		PluralizeRule 
			match: '.*s\>'
			removeEnding: ''
			addEnding: '' .
			
		PluralizeRule 
			match: '.*'
			removeEnding: ''
			addEnding: 's'
	}
]

{ #category : #'*SingularizePluralize' }
String >> uncountableNouns [
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
