"
Implementation of Sokoban game
"
Class {
	#name : #Sokoban,
	#superclass : #Object,
	#instVars : [
		'mapWidth',
		'mapHeight',
		'desSquaresArray',
		'playerPosition',
		'level1'
	],
	#category : #MySokoban
}

{ #category : #mainMethods }
Sokoban >> calculateDesSquares [

	" Collection of array to store cell indexes for 'x' and 'O' cells"

	| cell |
	0 to: mapHeight - 1 do: [ :row | 
		0 to: mapWidth - 1 do: [ :col | 
			cell := row * mapWidth + col + 1.
			((level1 at: cell) == $x or: (level1 at: cell) == $O) ifTrue: [ 
				desSquaresArray add: cell ] ] ]
]

{ #category : #directions }
Sokoban >> d [

	"Move down actipn is performed and also after each move it checks for any X or O postions are crossed if yes reset them back to original positions"

	self moveCharacterOffset: mapWidth.
	self resetXCells
]

{ #category : #mainMethods }
Sokoban >> desSquaresArray [

	"return desSquaresArray "

	^ desSquaresArray
]

{ #category : #mainMethods }
Sokoban >> display [

	"display the string on on Transcript with the help of traceCr."

	Transcript clear.
	self asString traceCr
]

{ #category : #initialization }
Sokoban >> initialize [

	"initialize  default values .similar like constructors in java. this method will invoke whenever there a new keyword found on time of object creation. also we are overriding the initialize method here. it calls the super classs initialize"

	mapWidth := 8.
	mapHeight := 10.
	desSquaresArray := OrderedCollection new.
	self levelInitialize.
	self calculateDesSquares.
	self updatePlayerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> isBox: offset [

	"Check is there a box next to player "

	^ (level1 at: playerPosition + offset) = $B
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxDoesNotHitAnotherBox: offset [

	"Check is there a box and another next to player so that he cannot make any movement of box"

	^ (level1 at: playerPosition + (offset * 2)) ~= $B
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxDoesNotHitAnotherWall: offset [

	"Check is there a box and wall next to the box from player position so that he cannot make any movement of box"

	^ (level1 at: playerPosition + (offset * 2)) ~= $#
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxDoesNotHitOnTarget: offset [

	"Check is there a box and next to the box any target is present. so that he cannot make any movement of box"

	^ (level1 at: playerPosition + (offset * 2)) ~= $O
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxOnTarget: offset [

	"Check is there a box on Target"

	^ (level1 at: playerPosition + offset) = $O
]

{ #category : #'getteres and setters' }
Sokoban >> isNewBoxPositionIsEmpty: newBoxPosition [

	"Check if new box is empty"

	^ (level1 at: newBoxPosition) = Character space
]

{ #category : #'getteres and setters' }
Sokoban >> isNewBoxPositionIsTarget: newBoxPosition [

	"Check if new box is target "

	^ (level1 at: newBoxPosition) = $x
]

{ #category : #'getteres and setters' }
Sokoban >> isNoWall: offset [

	"Check is there a wall next to player "

	^ (level1 at: playerPosition + offset) ~= $#
]

{ #category : #directions }
Sokoban >> l [

	"Move left actipn is performed and also after each move it checks for any X or O postions are crossed if yes reset them back to original positions"

	self moveCharacterOffset: -1.
	self resetXCells
]

{ #category : #'getteres and setters' }
Sokoban >> level1 [

	"return my leave1 1D array"

	^ level1
]

{ #category : #initialization }
Sokoban >> levelInitialize [

	"Initialze my Array with byteString. 1Dimensional."

	level1 := '#####   ' , '#xB ### ' , '###   # ' , '#x@B  # '
	          , '### Bx# ' , '#x##B # ' , '# # x ##' , '#B OBBx#'
	          , '#   x  #' , '########'
]

{ #category : #'getteres and setters' }
Sokoban >> mapHeight [

	" return height of the level1"

	^ mapHeight
]

{ #category : #'getteres and setters' }
Sokoban >> mapWidth [

	" return width of the level1"

	^ mapWidth
]

{ #category : #mainMethods }
Sokoban >> moveCharacterOffset: offset [

	"Logic of sokoban here: Offset is basically a number which tells about directions up/down/left/right"

	| newBoxPosition |
	self updatePlayerPosition.

	(self isNoWall: offset) ifTrue: [ "if player doesn't hit the wall"
		(((self isBox: offset) or: [ self isBoxOnTarget: offset ]) and: [ "if player hits the box or the box on target cell and box doesn't hit a wall or another box or box on target cell"
			 (self isBoxDoesNotHitAnotherWall: offset) or: [ 
				 (self isBoxDoesNotHitAnotherBox: offset) or: [ 
					 self isBoxDoesNotHitOnTarget: offset ] ] ])
			ifTrue: [ 
				newBoxPosition := self newBoxPosition: offset.
				(self isNewBoxPositionIsEmpty: newBoxPosition) ifTrue: [ "if the square next to the Box is empty push the box and update player position"
					self
						pushBoxOnEmptyCellAndUpdatePlayerPosition: newBoxPosition
						with: offset ].

				(self isNewBoxPositionIsTarget: newBoxPosition) ifTrue: [ "if the square next to the Box is target push the box and update player position"
					self
						pushBoxOnTargetAndUpdatePlayerPosition: newBoxPosition
						with: offset ] ]
			ifFalse: [ "if the square next to the player is a wall reset and update the player position" 
				self resetAndUpdateThePlayerPostion: offset ] ].
	self updatePlayerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> newBoxPosition: offset [

	"returns an newposition calculated by current positions adding with number of offset positions inoder to move. used in main logic of the sokobon"

	^ playerPosition + (offset * 2)
]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition [

	"return the player position"

	^ playerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> printOn: stream [

	"astream to print out the array string from level1"

	1 to: mapHeight do: [ :x | 
		1 to: mapWidth do: [ :y | 
		stream nextPut: (level1 at: x - 1 * mapWidth + y) ].
		stream cr ]
]

{ #category : #'getteres and setters' }
Sokoban >> pushBoxOnEmptyCellAndUpdatePlayerPosition: newBoxPosition with: offset [

	"push the Box is empty cell and update player position"

	self putBoxOnEmptyPosition: newBoxPosition.
	self putCurrentPlayerPositionAndResetPreviousPlayerPosition: offset
]

{ #category : #'getteres and setters' }
Sokoban >> pushBoxOnTarget: newBoxPosition [

	"push box on target"

	^ level1 at: newBoxPosition put: $O
]

{ #category : #'getteres and setters' }
Sokoban >> pushBoxOnTargetAndUpdatePlayerPosition: newBoxPosition with: offset [

	"push the box on target update player position"

	self pushBoxOnTarget: newBoxPosition.
	self putCurrentPlayerPositionAndResetPreviousPlayerPosition: offset
]

{ #category : #'getteres and setters' }
Sokoban >> putBoxOnEmptyPosition: newBoxPosition [

	"push the box on empty position"

	^ level1 at: newBoxPosition put: $B
]

{ #category : #'getteres and setters' }
Sokoban >> putCurrentPlayerPositionAndResetPreviousPlayerPosition: offset [

	"put the player in current position and also reset,update the player previous positions"

	self putPlayerInCurrentPosition: offset.
	self resetPreviousPlayerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> putPlayerInCurrentPosition: offset [

	"put player in current position"

	^ level1 at: playerPosition + offset put: $@
]

{ #category : #directions }
Sokoban >> r [

	"Move right actipn is performed and also after each move it checks for any X or O postions are crossed if yes reset them back to original positions"

	self moveCharacterOffset: 1.
	self resetXCells
]

{ #category : #'getteres and setters' }
Sokoban >> resetAndUpdateThePlayerPostion: offset [

	"reset and update the player position"

	self resetPreviousPlayerPosition.
	self putPlayerInCurrentPosition: offset
]

{ #category : #'getteres and setters' }
Sokoban >> resetPreviousPlayerPosition [

	"reset the player to empty"

	^ level1 at: playerPosition put: Character space
]

{ #category : #mainMethods }
Sokoban >> resetXCells [

	"checks for any X or O postions are crossed if yes reset them back to original positions"

	| desCount size |
	desCount := 0.
	size := desSquaresArray size.
	1 to: size do: [ :i | 
		(level1 at: (desSquaresArray at: i)) = $O ifTrue: [ 
			desCount := desCount + 1 ].
		(level1 at: (desSquaresArray at: i)) = Character space ifTrue: [ 
			level1 at: (desSquaresArray at: i) put: $x ] ]
]

{ #category : #directions }
Sokoban >> u [

	"Move up actipn is performed and also after each move it checks for any X or O postions are crossed if yes reset them back to original positions"

	self moveCharacterOffset: 0 - 1 * mapWidth.
	self resetXCells
]

{ #category : #mainMethods }
Sokoban >> updatePlayerPosition [

	"get the position of where player is located"

	playerPosition := level1 indexOf: $@
]
