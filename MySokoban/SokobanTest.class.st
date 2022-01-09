"
A MapTest is a test class for testing the behavior of Map
"
Class {
	#name : #SokobanTest,
	#superclass : #TestCase,
	#instVars : [
		'sokoban'
	],
	#category : #MySokoban
}

{ #category : #tests }
SokobanTest >> setUp [

	sokoban := Sokoban new.
]

{ #category : #tests }
SokobanTest >> testCalculateDesSquares [

	self assert: sokoban desSquaresCount equals: 8
]

{ #category : #tests }
SokobanTest >> testManPositionNumber [

self assert: ( sokoban  mapArray at:27 )  equals: $@.

]

{ #category : #test }
SokobanTest >> testMoveCharacterXYOffset [

	| map |
	map := Sokoban new.
	map moveCharacterOffset: 1.

	self assert: map x equals: 4.
	self assert: map y equals: 4.
]

{ #category : #test }
SokobanTest >> testPlayerPosition [

self assert: sokoban playerPosition equals: 27.
self assert: sokoban x equals: 3.
self assert: sokoban y equals: 4.
]
