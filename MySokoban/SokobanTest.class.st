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

	self assert: sokoban  desSquaresCount equals: 8
]

{ #category : #test }
SokobanTest >> testGetPositionManXY [

	self assert: sokoban x equals: 3.
	self assert: sokoban y equals: 4
]

{ #category : #test }
SokobanTest >> testInitializeWidthAndHeight [

self assert: sokoban maxWidth equals: 8.
self assert: sokoban maxHeight equals: 10.

]

{ #category : #test }
SokobanTest >> testL [

	|soko|
	soko:= Sokoban new.
	soko asString.

	soko r.soko r.soko r.soko r.
	soko l.
	self assert: soko asString equals: '#####   
#xB ### 
###   # 
#x @ B# 
### Bx# 
#x##B # 
# # x ##
#B OBBx#
#   x  #
########'
	
]

{ #category : #tests }
SokobanTest >> testManPositionNumber [

self assert: ( sokoban  mapArray at:27 )  equals: $@.

]

{ #category : #test }
SokobanTest >> testMoveCharacterRight [

	| map |
	map := Sokoban new.
	map moveCharacterOffset: 1.
	self assert: map x equals: 4.
	self assert: map y equals: 4.
	map display.
]

{ #category : #test }
SokobanTest >> testPlayerPosition [

self assert: sokoban playerPosition equals: 27.

]

{ #category : #test }
SokobanTest >> testR [

	|soko|
	soko:= Sokoban new.
	soko asString.

	soko r.soko r.soko r.soko r.
	self assert: soko playerPosition equals: 29.
	self assert: soko playerPosition equals: '#####   
#xB ### 
###   # 
#x  @B# 
### Bx# 
#x##B # 
# # x ##
#B OBBx#
#   x  #
########'
	
]
