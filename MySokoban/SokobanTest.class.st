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

	self assert: sokoban desSquaresArray size equals: 8
]

{ #category : #test }
SokobanTest >> testD [

	| soko |
	soko := Sokoban new.
	soko asString.

	soko r.
	soko r.
	soko d.
	soko l.
	soko d.
	self assert: soko playerPosition equals: 36
]

{ #category : #test }
SokobanTest >> testInitializeWidthAndHeight [

self assert: sokoban maxWidth equals: 8.
self assert: sokoban maxHeight equals: 10.

]

{ #category : #test }
SokobanTest >> testIsBox [

	| soko |
	soko := Sokoban new.
	self assert: (soko isBox: 1).

]

{ #category : #test }
SokobanTest >> testIsBoxDoesNotHitAnotherBox [

	| soko |
	soko := Sokoban new.
	self assert: (soko isBoxDoesNotHitAnotherWall: 1).
	
]

{ #category : #test }
SokobanTest >> testIsNoWall [

	| soko |
	soko := Sokoban new.
	self assert: (soko isNoWall: 1).
	self assert: (soko isNoWall: 1) value equals: true.
	self assert: (soko isNoWall: -1) value equals: true.
	self assert: (soko isNoWall: 8) value equals: false.
	self assert: (soko isNoWall: -8) value equals: false
]

{ #category : #test }
SokobanTest >> testL [

	|soko|
	soko:= Sokoban new.
	soko asString.

	soko r.soko r.
	soko l.
	self assert: soko playerPosition equals: 28.
]

{ #category : #test }
SokobanTest >> testLWithString [

	| soko |
	soko := Sokoban new.

	soko r.
	soko r.
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
########
'
]

{ #category : #tests }
SokobanTest >> testManPositionNumber [

self assert: ( sokoban  mapArray at:27 )  equals: $@.

]

{ #category : #test }
SokobanTest >> testPutPlayerInCurrentPosition [

	| soko |
	soko := Sokoban new.
	soko putPlayerInCurrentPosition: 1.
	self assert: (soko mapArray at: soko playerPosition) equals: $@.
	self assert: (soko mapArray at: soko playerPosition + 1) equals: $@
]

{ #category : #test }
SokobanTest >> testR [

	|soko|
	soko:= Sokoban new.
	soko asString.

	soko r.soko r.
	self assert: soko playerPosition equals: 29.

]

{ #category : #test }
SokobanTest >> testRR [

	|soko|
	soko:= Sokoban new.
	soko asString.

	soko r.soko r.soko r.soko r.
	self assert: soko playerPosition equals: 29.
	
]

{ #category : #test }
SokobanTest >> testRWithString [

	|soko|
	soko:= Sokoban new.
	soko asString.

	soko r.soko r.
	self assert: soko playerPosition equals: 29.
	self assert: soko asString equals: '#####   
#xB ### 
###   # 
#x  @B# 
### Bx# 
#x##B # 
# # x ##
#B OBBx#
#   x  #
########
'
	
]

{ #category : #test }
SokobanTest >> testResetAndUpdateThePlayerPostion [

	| soko |
	soko := Sokoban new.
	self assert: soko updatePlayerPosition playerPosition equals: 27.
	soko resetAndUpdateThePlayerPostion: 1.
   self
		assert: (soko mapArray at: soko playerPosition)
		equals: Character space.

	self assert: (soko mapArray at: soko playerPosition + 1) equals: $@.
	self assert: soko updatePlayerPosition playerPosition equals: 28
]

{ #category : #test }
SokobanTest >> testResetPreviousPlayerPosition [

	| soko |
	soko := Sokoban new.
	soko resetPreviousPlayerPosition.
	self assert: (soko mapArray at: soko playerPosition) equals: Character space.

]

{ #category : #test }
SokobanTest >> testResetXCells [

	|soko|
	soko:= Sokoban new.
	
	soko l.
	soko r.
	soko resetXCells. 
   self assert: ( soko  mapArray at:26 )  equals: $x.
]

{ #category : #test }
SokobanTest >> testU [

	|soko|
	soko:= Sokoban new.
	self assert: (soko r;r;u) updatePlayerPosition playerPosition equals: 21.
]

{ #category : #test }
SokobanTest >> testUpdatePlayerPosition [

	| soko |
	soko := Sokoban new.
   self assert: soko playerPosition  equals: 27.
	soko r.
	self assert: soko updatePlayerPosition playerPosition  equals: 28
]
