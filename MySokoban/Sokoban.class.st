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

{ #category : #mainMethods }
Sokoban >> displayMap [

	0 to: (mapArray length)  do: [ :each | mapArray cr ].

]

{ #category : #initialization }
Sokoban >> initialize [

	mapWidth := 8.
	mapHeight := 10.
	desSquaresArray := OrderedCollection new.
	self mapInitialize.
	self calculateDesSquares.
	self updatePlayerPosition.
	self mapArraySize.
	self updatePlayerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> isNoWall: offsetNumber [

	^ (mapArray at: playerPosition + offsetNumber) ~= $#
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

	| newBoxPosition |
	self updatePlayerPosition.
1 halt.
	(self isNoWall: offsetNumber) ifTrue: [ 
		(((mapArray at: playerPosition + offsetNumber) = $B or: [ 
			  (mapArray at: playerPosition + offsetNumber) = $O ]) and: [ 
			 (mapArray at: playerPosition + (offsetNumber * 2)) ~= $# or: [ 
				 (mapArray at: playerPosition + (offsetNumber * 2)) ~= $B or: [ 
					 (mapArray at: playerPosition + (offsetNumber * 2)) ~= $O ] ] ])
			ifTrue: [ 
				newBoxPosition := playerPosition + (offsetNumber * 2).
				(mapArray at: newBoxPosition) = Character space ifTrue: [ 
					mapArray at: newBoxPosition put: $B.
					mapArray at: playerPosition + offsetNumber put: $@.
					mapArray at: playerPosition put: Character space ].

				(mapArray at: newBoxPosition) = $x ifTrue: [ 
					mapArray at: newBoxPosition put: $O.
					mapArray at: playerPosition + offsetNumber put: $@.
					mapArray at: playerPosition put: Character space ] ]
			ifFalse: [ 
				mapArray at: playerPosition put: Character space.
				mapArray at: playerPosition + offsetNumber put: $@ ] ].
	self updatePlayerPosition
]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition [

^ playerPosition.


]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition: anInteger [

	playerPosition := anInteger.
]

{ #category : #'getteres and setters' }
Sokoban >> printOn: stream [

	(1 to: mapHeight) do: [ :index | 
		1 to: mapWidth do: [ :index2 | 
			stream nextPut: (mapArray at: index - 1 * mapWidth + index2) ].
		stream cr ]
]

{ #category : #directions }
Sokoban >> r [

	self moveCharacterOffset: 1.
	self resetXCells
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

	playerPosition := mapArray indexOf: $@.


]
