Extension { #name : #String }

{ #category : #'*SingularizePluralize' }
String >> asPlural [
	"Convert a noun to its plural form"
	| rule |
	
	(self uncountableNouns includes: self) ifTrue: [ ^ self ].
	self irregularNouns at: self ifPresent: [ :plural | ^ plural ].
	
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
			addEnding: 'zes' .
			
		PluralizeRule
			matchDoNothing: 'oxen\>' .
			
		PluralizeRule
			match: 'ox\>'
			addEnding: 'en' .
			
		PluralizeRule
			matchDoNothing: '.*[ml]ice\>' .
			
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
			addEnding: 'es' .
			
		PluralizeRule 
			match: '.*([^aeiouy]|qu)y\>'
			removeEnding: 'y\>'
			addEnding: 'ies' .
			
		PluralizeRule 
			match: '.*hive\>'
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
			matchDoNothing: '.*[ti]a\>' .
			
		PluralizeRule 
			match: '.*[ti]um\>'
			removeEnding: 'um\>'
			addEnding: 'a' .
			
		PluralizeRule 
			match: '.*(buffal|potat|tomat)o\>'
			addEnding: 'es' .
			
		PluralizeRule
			match: '.*bus\>'
			addEnding: 'es' .
			
		PluralizeRule 
			match: '.*(alias|status)\>'
			addEnding: 'es' .
			
		PluralizeRule 
			matchDoNothing: '.*(octop|vir)i\>' .
			
		PluralizeRule
			match: '.*(octop|vir)us\>'
			removeEnding: 'us\>'
			addEnding: 'i' .
			
		PluralizeRule 
			match: '(ax|test)is\>'
			removeEnding: 'is\>'
			addEnding: 'es' .
			
		PluralizeRule 
			matchDoNothing: '.*s\>' .
			
		PluralizeRule 
			match: '.*'
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
