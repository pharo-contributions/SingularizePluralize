Class {
	#name : #BaselineOfSingularizePluralize,
	#superclass : #BaselineOf,
	#category : #BaselineOfSingularizePluralize
}

{ #category : #baselines }
BaselineOfSingularizePluralize >> baseline: spec [
	<baseline>
	spec for: #common do: [	
				
		"Packages"
		spec 
			package: 'SingularizePluralize';
			package: 'SingularizePluralize-Tests' with: [ spec requires: #('SingularizePluralize') ] ].
]
