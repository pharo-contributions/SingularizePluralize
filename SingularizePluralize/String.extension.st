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
	| rule |
	
	rule := self singularizeRules
		detect: [ :r | r matches: self ]
		ifNone: [ ^ self ].
		
	^ rule singularize: self
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
		'zombie' -> 'zombies' .
		'foot' -> 'feet'
	} asDictionary.
]

{ #category : #'*SingularizePluralize' }
String >> pluralizeRules [
	| rules |
	
	rules := (self uncountableNouns collect: [ :noun |
		PluralizeRule 
			matchDoNothing: '.*', noun, '\>'
		]) asOrderedCollection.
	
	self irregularNouns keysAndValuesDo: [ :singular :plural |
		rules add: (PluralizeRule 
			match: '.*', singular, '\>'
			removeEnding: singular, '\>'
			addEnding: plural) ].
	
	rules addAll: { 
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
	}.
		
	^ rules
]

{ #category : #'*SingularizePluralize' }
String >> singularizeRules [
	| rules |
	
	rules := (self uncountableNouns collect: [ :noun |
		SingularizeRule 
			matchDoNothing: '.*', noun, '\>'
		]) asOrderedCollection.
	
	self irregularNouns keysAndValuesDo: [ :singular :plural |
		rules add: (SingularizeRule 
			match: '.*', plural, '\>'
			removeEnding: plural, '\>'
			addEnding: singular) ].
		
	rules addAll: { 
		SingularizeRule 
			match: '.*databases\>'
			removeEnding: 's\>' .
			
		SingularizeRule
			match: '.*quizzes\>'
			removeEnding: 'zes\>' .
			
		SingularizeRule 
			match: '.*matrices\>'
			removeEnding: 'ices\>'
			addEnding: 'ix' .
			
		SingularizeRule 
			match: '.*(vert|ind)ices\>'
			removeEnding: 'ices\>'
			addEnding: 'ex' .
			
		SingularizeRule 
			match: 'oxen\>'
			removeEnding: 'en\>' .
			
		SingularizeRule 
			match: '.*(alias|status)es\>'
			removeEnding: 'es\>' .
			
		SingularizeRule 
			matchDoNothing: '.*(alias|status)\>' .
			
		SingularizeRule
			match: '.*(octop|vir)(us|i)\>'
			removeEnding: '(us|i)\>'
			addEnding: 'us' .
			
		SingularizeRule 
			match: 'ax[ie]s\>'
			removeEnding: '[ie]s\>'
			addEnding: 'is' .
			
		SingularizeRule 
			match: '.*(cris|test)(is|es)\>'
			removeEnding: '(is|es)\>'
			addEnding: 'is' .
			
		SingularizeRule
			match: '.*shoes\>' 
			removeEnding: 's\>' .
			
		SingularizeRule 
			match: '.*oes\>'
			removeEnding: 'es\>' .
			
		SingularizeRule 
			matchDoNothing: '.*bus\>' .
			
		SingularizeRule 
			match: '.*buses\>'
			removeEnding: 'es\>' .
			
		SingularizeRule 
			match: '.*[ml]ice\>'
			removeEnding: 'ice\>'
			addEnding: 'ouse' .
			
		SingularizeRule
			match: '.*(x|ch|ss|sh)es\>'
			removeEnding: 'es\>' .
			
		SingularizeRule 
			match: '.*movies\>'
			removeEnding: 's\>' .
			
		SingularizeRule 
			matchDoNothing: '.*series\>' .
			
		SingularizeRule 
			match: '.*([^aeiouy]|qu)ies\>'
			removeEnding: 'ies\>'
			addEnding: 'y' .
			
		SingularizeRule
			match: '.*[lr]ves\>'
			removeEnding: 'ves\>'
			addEnding: 'f' .
			
		SingularizeRule
			match: '.*(tive|hive)s\>'
			removeEnding: 's\>' .
			
		SingularizeRule
			match: '.*[^f]ves\>'
			removeEnding: 'ves\>'
			addEnding: 'fe' .
			
		SingularizeRule 
			match: '.*(the|synop|progno|parenthe|diagno|ba|analy)(sis|ses)\>'
			removeEnding: '(sis|ses)\>'
			addEnding: 'sis' .
			
		SingularizeRule 
			match: '.*[ti]a\>'
			removeEnding: 'a\>'
			addEnding: 'um' .
			
		SingularizeRule 
			matchDoNothing: '.*news\>' .
			
		SingularizeRule
			matchDoNothing: '.*ss\>' .
			
		SingularizeRule 
			match: '.*s\>'
			removeEnding: 's\>'
	}.
	
	^ rules
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
	species
	beef
	folk).
]
