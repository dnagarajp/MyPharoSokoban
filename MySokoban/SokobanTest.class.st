Class {
	#name : #SokobanTest,
	#superclass : #TestCase,
	#instVars : [
		'man'
	],
	#category : #MySokoban
}

{ #category : #initialization }
SokobanTest >> setUp [ 

man := Sokoban new.
]

{ #category : #initialization }
SokobanTest >> testGetPosition [
]

{ #category : #initialization }
SokobanTest >> testMapIsInitailized [

self assert: (man map at:4 at:3 )  equals: $@
]

{ #category : #initialization }
SokobanTest >> testXYIntializeValue [

self assert: man x equals: 1.
self assert: man y equals: 0.
self assert: man maxWidth equals: 8.
self assert: man maxHeight equals: 10.
]
