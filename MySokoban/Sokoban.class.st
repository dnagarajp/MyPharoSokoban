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

{ #category : #directions }
Sokoban >> d [

self moveCharacterOffset: mapWidth .
self resetXCells. 
]

{ #category : #mainMethods }
Sokoban >> desSquaresArray [

	^ desSquaresArray
]

{ #category : #mainMethods }
Sokoban >> display [

	Transcript clear.
	self asString traceCr
]

{ #category : #initialization }
Sokoban >> initialize [

	mapWidth := 8.
	mapHeight := 10.
	desSquaresArray := OrderedCollection new.
	self mapInitialize.
	self calculateDesSquares.
	self updatePlayerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> isBox: offset [



	^ (mapArray at: playerPosition + offset) = $B
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxDoesNotHitAnotherBox: offset [

	^ (mapArray at: playerPosition + (offset * 2)) ~= $B
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxDoesNotHitAnotherWall: offset [

	^ (mapArray at: playerPosition + (offset * 2)) ~= $#
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxDoesNotHitOnTarget: offset [

	^ (mapArray at: playerPosition + (offset * 2)) ~= $O
]

{ #category : #'getteres and setters' }
Sokoban >> isBoxOnTarget: offset [

	^ (mapArray at: playerPosition + offset) = $O.
	


]

{ #category : #'getteres and setters' }
Sokoban >> isNewBoxPositionIsEmpty: newBoxPosition [

	^ (mapArray at: newBoxPosition) = Character space
]

{ #category : #'getteres and setters' }
Sokoban >> isNewBoxPositionIsTarget: newBoxPosition [

	^ (mapArray at: newBoxPosition) = $x
]

{ #category : #'getteres and setters' }
Sokoban >> isNoWall: offset [

	^ (mapArray at: playerPosition + offset) ~= $#
	
]

{ #category : #directions }
Sokoban >> l [

	self moveCharacterOffset: -1.
	self resetXCells.
]

{ #category : #'getteres and setters' }
Sokoban >> mapArray [

^ mapArray.

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
Sokoban >> moveCharacterOffset: offset [

	| newBoxPosition |
	self updatePlayerPosition.

	(self isNoWall: offset) ifTrue: [ 
		(((self isBox: offset) or: [ self isBoxOnTarget: offset ]) and: [ 
			 (self isBoxDoesNotHitAnotherWall: offset) or: [ 
				 (self isBoxDoesNotHitAnotherBox: offset) or: [ 
					 self isBoxDoesNotHitOnTarget: offset ] ] ])
			ifTrue: [ 
				newBoxPosition := self newBoxPosition: offset.
				(self isNewBoxPositionIsEmpty: newBoxPosition) ifTrue: [ 
					self
						pushBoxOnEmptyCellAndUpdatePlayerPosition: newBoxPosition
						with: offset ].

				(self isNewBoxPositionIsTarget: newBoxPosition) ifTrue: [ 
					self
						pushBoxOnTargetAndUpdatePlayerPosition: newBoxPosition
						with: offset ] ]
			ifFalse: [ self resetAndUpdateThePlayerPostion: offset ] ].

	self updatePlayerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> newBoxPosition: offset [

	^ playerPosition + (offset * 2).
]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition [

^ playerPosition.


]

{ #category : #'getteres and setters' }
Sokoban >> printOn: stream [

	1 to: mapHeight do: [ :x | 
		1 to: mapWidth do: [ :y | 
		stream nextPut: (mapArray at: (((x - 1) * mapWidth) + y)) ].
		stream cr ]
]

{ #category : #'getteres and setters' }
Sokoban >> pushBoxOnEmptyCellAndUpdatePlayerPosition: newBoxPosition with: offset [

	self putBoxOnEmptyPosition: newBoxPosition.
	self putCurrentPlayerPositionAndResetPreviousPlayerPosition: offset.
]

{ #category : #'getteres and setters' }
Sokoban >> pushBoxOnTarget: newBoxPosition [

	^ mapArray at: newBoxPosition put: $O.
]

{ #category : #'getteres and setters' }
Sokoban >> pushBoxOnTargetAndUpdatePlayerPosition: newBoxPosition with: offset [

	self pushBoxOnTarget: newBoxPosition.
	self putCurrentPlayerPositionAndResetPreviousPlayerPosition: offset
]

{ #category : #'getteres and setters' }
Sokoban >> putBoxOnEmptyPosition: newBoxPosition [

	^ (mapArray at: newBoxPosition put: $B)
]

{ #category : #'getteres and setters' }
Sokoban >> putCurrentPlayerPositionAndResetPreviousPlayerPosition: offset [

	self putPlayerInCurrentPosition: offset.
   self resetPreviousPlayerPosition. 
]

{ #category : #'getteres and setters' }
Sokoban >> putPlayerInCurrentPosition: offset [

	^ mapArray at: playerPosition + offset put: $@
]

{ #category : #directions }
Sokoban >> r [

	self moveCharacterOffset: 1.
	self resetXCells
]

{ #category : #'getteres and setters' }
Sokoban >> resetAndUpdateThePlayerPostion: offset [

	self resetPreviousPlayerPosition.
	self putPlayerInCurrentPosition: offset.
]

{ #category : #'getteres and setters' }
Sokoban >> resetPreviousPlayerPosition [

	^ mapArray at: playerPosition put: Character space
]

{ #category : #mainMethods }
Sokoban >> resetXCells [
|desCount size|

desCount  := 0.
size := desSquaresArray size.
1 to: size do: [:i | 
  (mapArray  at: (desSquaresArray at: i)) = $O
    ifTrue: [desCount := desCount + 1].
  ( mapArray  at: (desSquaresArray at: i)) = (Character space)
    ifTrue: [mapArray  at: (desSquaresArray at: i) put: $x
	]
].
]

{ #category : #directions }
Sokoban >> u [

self moveCharacterOffset: ((0-1)* mapWidth) .
self resetXCells. 
]

{ #category : #mainMethods }
Sokoban >> updatePlayerPosition [

	playerPosition := mapArray indexOf: $@
]
