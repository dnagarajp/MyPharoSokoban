"
Implementation of Sokoban game
"
Class {
	#name : #Sokoban,
	#superclass : #Object,
	#instVars : [
		'mapWidth',
		'mapHeight',
		'mapArray',
		'desSquaresArray',
		'x',
		'y',
		'playerPosition'
	],
	#category : #MySokoban
}

{ #category : #'as yet unclassified' }
Sokoban class >> emergencyStop [

 ^ true .
	

]

{ #category : #'as yet unclassified' }
Sokoban class >> playGame [

	| soko |
	soko := Sokoban new.

	[self emergencyStop] whileFalse: [ 
		| enteredText |
		soko mapArray.
		enteredText := UIManager default request: 'Please enter wsad'.
		soko mainToCallFucntion: enteredText.
		Transcript show: soko mapArray ; cr.]
	

]

{ #category : #mainMethods }
Sokoban >> calculateDesSquares [

	| cell |

	0 to: mapHeight-1 do: [ :row | 
		0 to: mapWidth-1 do: [ :col | 
			cell := row * mapWidth + col+ 1.
			((mapArray at: cell) == $x or: (mapArray at: cell) == $O) ifTrue: [ 
				desSquaresArray add: cell ] ] ].
	
]

{ #category : #mainMethods }
Sokoban >> desSquaresCount [

	^ desSquaresArray size.
]

{ #category : #mainMethods }
Sokoban >> displayMap [

	0 to: (mapArray length)  do: [ :each | mapArray cr ].

]

{ #category : #mainMethods }
Sokoban >> getPositionManXY [
| cell|

	1 to: mapHeight  do: [ :row | 
		1 to: mapWidth do: [ :col | 
			cell := ((row -1) * mapWidth) + col.
			((mapArray at: cell) == $@) ifTrue: [ 
				 x := col. y :=row]]].

]

{ #category : #initialization }
Sokoban >> initialize [

	mapWidth := 8.
	mapHeight := 10.
	x := 0.
	y := 0.
	desSquaresArray := OrderedCollection new.
	self mapInitialize.
	self calculateDesSquares.
	self getPositionManXY.
	self mapArraySize.
	self playerPosition.
	
	
]

{ #category : #mainMethods }
Sokoban >> mainToCallFucntion: key [
"implementation is in progress still"

|soko|

soko:= self class new.

(key =='w')ifTrue: [
	(soko moveCharacterOffset: -8)].

(key =='s')ifTrue: [ 
	soko moveCharacterOffset: (soko maxWidth)].

(key =='a')ifTrue: [ 
	soko moveCharacterOffset: -1].

(key =='d')ifTrue: [ 
	soko moveCharacterOffset: 1].

(key =='exit')ifTrue: [ soko emergencyStop ].



]

{ #category : #'getteres and setters' }
Sokoban >> mapArray [

^ mapArray.

]

{ #category : #'getteres and setters' }
Sokoban >> mapArraySize [

^ mapArray size.
]

{ #category : #initialization }
Sokoban >> mapInitialize [

	mapArray  :=   '#####   ',
    '#xB ### ',
    '###   # ',
    '#x@B  # ',
    '### Bx# ',
    '#x##B # ',
    '# # x ##',
    '#B OBBx#',
    '#   x  #',
    '########'.
]

{ #category : #'getteres and setters' }
Sokoban >> maxHeight [
	^ mapHeight .
]

{ #category : #'getteres and setters' }
Sokoban >> maxWidth [
	^ mapWidth .
]

{ #category : #mainMethods }
Sokoban >> moveCharacterOffset: offsetNumber [

	| newPosition |
	(mapArray at: playerPosition + offsetNumber) ~= $# ifTrue: ["1st If:::"  "if player doesn't hit the wall"
		((mapArray at: (playerPosition + offsetNumber)) == $B)   "if player hits the box"
		| ((mapArray at: (playerPosition + offsetNumber)) == $O) " or box on 'x' cell"
		& ((mapArray at: playerPosition + (offsetNumber * 2)) ~= $#)   " and box doesn't hit the wall"
		| ((mapArray at: playerPosition + (offsetNumber * 2)) ~= $B)    "or another box"
		| ((mapArray at: playerPosition + (offsetNumber * 2)) ~= $O)   "or box on 'x' cell"
			ifTrue: [ "2nd if:::"  
				mapArray at: playerPosition put: Character space. "clear previous player position"
				x := x + offsetNumber.  "update the player's co- ordinate"
				(mapArray at: playerPosition + offsetNumber) == Character space " if the square next to the box empty"
					ifTrue: [ "3rd if true" ""
						newPosition := playerPosition + offsetNumber. ""
						mapArray at: newPosition put: $B ]."push the box to a new position"
				((mapArray at: (playerPosition + offsetNumber)) == $x) " if the square next to the box is 'x'"
					ifTrue: [  "3rd else if"
						newPosition := playerPosition + offsetNumber.""
						mapArray at: newPosition put: $O ]     "Push the box on its place/target"
					ifFalse: [ "3rd else"
						newPosition := playerPosition - offsetNumber.
						mapArray at: newPosition put: $@. "if the box hits the wall or another box"". ""dont push it any further"""
						^ self].""	"3rd if close"
				mapArray at: playerPosition put: $@ ] "draw the player position in the new position" "2nd if closure."
			
			ifFalse: [
				mapArray playerPosition: Character space.  "clear the player position"
				x := x + offsetNumber."update the player co-ordinate".
				mapArray playerPosition: $@ ] ] "1st if closure" "draw the player position in the new position"
]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition [


playerPosition := ((((y-1) * mapWidth) +x)).

^ playerPosition.


]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition: anInteger [

	playerPosition := anInteger.
]

{ #category : #'getteres and setters' }
Sokoban >> x [

^x.
]

{ #category : #'getteres and setters' }
Sokoban >> x: anInteger [

 x:= anInteger 
]

{ #category : #'getteres and setters' }
Sokoban >> y [

^y.
]

{ #category : #'getteres and setters' }
Sokoban >> y: anInteger [

 y:= anInteger 
]
