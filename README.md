# SingularizePluralize

[![Build Status](https://travis-ci.org/olekscode/SingularizePluralize.svg?branch=master)](https://travis-ci.org/olekscode/SingularizePluralize)
[![Build status](https://ci.appveyor.com/api/projects/status/1dugaws6dlc20lts?svg=true)](https://ci.appveyor.com/project/olekscode/singularizepluralize)
[![Coverage Status](https://coveralls.io/repos/github/olekscode/SingularizePluralize/badge.svg?branch=master)](https://coveralls.io/github/olekscode/SingularizePluralize?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/olekscode/SingularizePluralize/master/LICENSE)
[![Pharo version](https://img.shields.io/badge/Pharo-6.1-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-7.0-%23aac9ff.svg)](https://pharo.org/download)
[![Pharo version](https://img.shields.io/badge/Pharo-8.0-%23aac9ff.svg)](https://pharo.org/download)

A simple [Pharo](http://pharo.org/) library for transforming singular nouns to their plural form and vice versa. The implementation is based on the [inflection](https://inflection.readthedocs.io/en/latest/_modules/inflection.html) library in Python.

## Installation

To install the packages of SingularizePluralize, go to the Playground (Ctrl+OW) in your Pharo image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'SingularizePluralize';
  repository: 'github://olekscode/SingularizePluralize/src';
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
