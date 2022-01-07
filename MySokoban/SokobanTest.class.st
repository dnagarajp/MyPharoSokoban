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
SokobanTest >> testXYIntializeValue [

self assert: man x equals: 0.
self assert: man y equals: 0.
self assert: man maxWidth equals: 8.
self assert: man maxHeight equals: 10.
]
