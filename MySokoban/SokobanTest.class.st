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
SokobanTest >> testInitialize [

	self assert: sokoban mapWidth equals: 8.
	self assert: sokoban mapHeight equals: 10.
	self assert: sokoban desSquaresArray size equals: 8.
	self assert: sokoban updatePlayerPosition playerPosition equals: 27.
	self assert: sokoban asString equals: '#####   
#xB ### 
###   # 
#x@B  # 
### Bx# 
#x##B # 
# # x ##
#B OBBx#
#   x  #
########
'
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
	self assert: (soko isBoxDoesNotHitAnotherBox: 1).
	
]

{ #category : #test }
SokobanTest >> testIsBoxDoesNotHitAnotherWall [

	| soko |
	soko := Sokoban new.
	self assert: (soko isBoxDoesNotHitAnotherWall: 1).
]

{ #category : #test }
SokobanTest >> testIsBoxDoesNotHitOnTarget [

	| soko |
	soko := Sokoban new.
	self assert: (soko isBoxDoesNotHitOnTarget:1)
]

{ #category : #test }
SokobanTest >> testIsBoxOnTarget [


	| soko |
	soko := Sokoban new.
	soko r;r;r;u;r;d.
	self assert: (soko isBoxOnTarget: 8).
]

{ #category : #test }
SokobanTest >> testIsNewBoxPositionIsEmpty [

	| soko |
	soko := Sokoban new.
	self assert: (soko isNewBoxPositionIsEmpty:6)
]

{ #category : #test }
SokobanTest >> testIsNewBoxPositionIsTarget [

	| soko |
	soko := Sokoban new.
	self assert: (soko isNewBoxPositionIsTarget:26)
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

self assert: ( sokoban  level1 at:27 )  equals: $@.

]

{ #category : #test }
SokobanTest >> testMoveCharacterOffset [

	| soko |
	soko := Sokoban new.

	soko moveCharacterOffset: 1.
	self assert: soko playerPosition equals: 28.
	soko moveCharacterOffset: -1.
	self assert: soko playerPosition equals: 27.
	soko moveCharacterOffset: 8.
	self assert: soko playerPosition equals: 27.
	soko moveCharacterOffset: -8.
	self assert: soko playerPosition equals: 27
]

{ #category : #test }
SokobanTest >> testNewBoxPosition [

	| soko  |
	soko := Sokoban new.
	self assert: (soko level1 at:(soko newBoxPosition: 1))equals: Character space.
]

{ #category : #test }
SokobanTest >> testPlayerPosition [

	| soko |
	soko := Sokoban new.
	self assert:soko playerPosition equals: 27
]

{ #category : #test }
SokobanTest >> testPushBoxOnEmptyCellAndUpdatePlayerPositionWith [


	| soko  |
	soko := Sokoban new.
	self assert: soko playerPosition equals: 27.
	soko pushBoxOnEmptyCellAndUpdatePlayerPosition: (soko playerPosition +2) with: 1.
	self assert: (soko level1 at:(soko playerPosition +2))equals: $B.
	self assert: (soko level1 at:(soko playerPosition + 1))equals: $@.
	self assert: (soko level1 at: soko playerPosition) equals: Character space.
]

{ #category : #test }
SokobanTest >> testPushBoxOnTarget [

	| soko  |
	soko := Sokoban new.
	soko pushBoxOnTarget:28.

	self
		assert: (soko level1 at:28)equals: $O
]

{ #category : #test }
SokobanTest >> testPushBoxOnTargetAndUpdatePlayerPositionWith [

	| soko  |
	soko := Sokoban new.
	self assert: soko playerPosition equals: 27.
	soko pushBoxOnTargetAndUpdatePlayerPosition: (soko playerPosition +2) with: 1.
	self assert: (soko level1 at:(soko playerPosition +2))equals: $O.
	self assert: (soko level1 at:(soko playerPosition + 1))equals: $@.
	self assert: (soko level1 at: soko playerPosition) equals: Character space.
]

{ #category : #test }
SokobanTest >> testPutBoxOnEmptyPosition [

	| soko  |
	soko := Sokoban new.
	soko putBoxOnEmptyPosition: 2.

	self
		assert: (soko level1 at: 2)equals: $B
]

{ #category : #test }
SokobanTest >> testPutCurrentPlayerPositionAndResetPreviousPlayerPosition [

	| soko |
	soko := Sokoban new.
	self assert: soko updatePlayerPosition playerPosition equals: 27.
	soko putCurrentPlayerPositionAndResetPreviousPlayerPosition: 1.
	self assert: (soko level1 at: soko playerPosition + 1) equals: $@.
	self assert: (soko level1 at: soko playerPosition) equals: Character space.
	self assert: soko updatePlayerPosition playerPosition equals: 28
]

{ #category : #test }
SokobanTest >> testPutPlayerInCurrentPosition [

	| soko |
	soko := Sokoban new.
	soko putPlayerInCurrentPosition: 1.
	self assert: (soko level1 at: soko playerPosition) equals: $@.
	self assert: (soko level1 at: soko playerPosition + 1) equals: $@
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
		assert: (soko level1 at: soko playerPosition)
		equals: Character space.

	self assert: (soko level1 at: soko playerPosition + 1) equals: $@.
	self assert: soko updatePlayerPosition playerPosition equals: 28
]

{ #category : #test }
SokobanTest >> testResetPreviousPlayerPosition [

	| soko |
	soko := Sokoban new.
	soko resetPreviousPlayerPosition.
	self assert: (soko level1 at: soko playerPosition) equals: Character space.

]

{ #category : #test }
SokobanTest >> testResetXCells [

	|soko|
	soko:= Sokoban new.
	
	soko l.
	soko r.
	soko resetXCells. 
   self assert: ( soko  level1 at:26 )  equals: $x.
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
	self assert: soko updatePlayerPosition playerPosition equals: 28
]
