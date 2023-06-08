# SingularizePluralize

[![Build status](https://github.com/olekscode/SingularizePluralize/workflows/CI/badge.svg)](https://github.com/olekscode/SingularizePluralize/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/SingularizePluralize/badge.svg?branch=master)](https://coveralls.io/github/olekscode/SingularizePluralize?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/SingularizePluralize/master/LICENSE)

A simple [Pharo](http://pharo.org/) library for transforming singular nouns to their plural form and vice versa. The implementation is based on the [inflection](https://inflection.readthedocs.io/en/latest/_modules/inflection.html) library in Python.

## Installation
 
To install the packages of SingularizePluralize, go to the Playground (Ctrl+OW) in your Pharo image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'SingularizePluralize';
  repository: 'github://pharo-contributions/SingularizePluralize/src';
  load.
```

## How to use it?

The package simply extends class `String` with two messages: `asSingular` and `asPlural`. Here are some examples of converting singular nouns to their plural forms:

```Smalltalk
'banana' asPlural. "bananas"
'man' asPlural. "men"
'woman' asPlural. "women"
'matrix' asPlural. "matrices"
'child' asPlural. "children"
'knife' asPlural. "knives"
'thesis' asPlural. "theses"
'auditorium' asPlural. "auditoria"
```

Similarly, we can convert plural nouns to their singular forms:

```Smalltalk
'bananas' asSingular. "banana"
'men' asSingular. "man"
'women' asSingular. "woman"
'matrices' asSingular. "matrix"
'children' asSingular. "child"
'knives' asSingular. "knife"
'theses' asSingular. "thesis"
'auditoria' asSingular. "auditorium"
```

## If you find a mistake

Natural languages including English are very complex and irregular. It is hard to capture all rules and exceptions of pluralization with one algorithm. If you try to convert a noun to its singular/plural form and encounter a mistake, please report it by creating an issue with the title **Singular (Plural) of "X" should be "Y" not "Z"**. I will create a rule or add an exception to cover that case.
