Class {
	#name : #Map,
	#superclass : #Object,
	#instVars : [
		'mapWidth',
		'mapHeight',
		'mapArray',
		'desSquaresArray'
	],
	#category : #MySokoban
}

{ #category : #getters }
Map >> calculateDesSquares [

	| cell |
	0 to: mapHeight-1 do: [ :row | 
		0 to: mapWidth-1 do: [ :col | 
			cell := row * mapWidth + col+ 1.
			((mapArray at: cell) == $x or: (mapArray at: cell) == $O) ifTrue: [ 
				desSquaresArray add: cell ] ] ]
]

{ #category : #getters }
Map >> desSquaresArray [

	^ desSquaresArray
]

{ #category : #getters }
Map >> desSquaresCount [

	^ desSquaresArray size.
]

{ #category : #getters }
Map >> getPosition [

	| count cell |
	count := 0.
	0 to: mapHeight-1 do: [ :row | 
		0 to: mapHeight-1 do: [ :col | 
			cell := row * mapWidth + col.
			((mapArray at: cell) == 'x' or: (mapArray at: cell) == 'O') 
				ifTrue: [ desSquaresArray at: count + 1 put: cell ] ] ].
	^ count
]

{ #category : #initialization }
Map >> initialize [

	mapWidth := 8.
	mapHeight := 10.
	desSquaresArray := OrderedCollection new.
	self mapInitialize.
	self calculateDesSquares
]

{ #category : #getters }
Map >> mapArray [

^ mapArray.

]

{ #category : #getters }
Map >> mapInitialize [

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

{ #category : #getters }
Map >> mapStoreLine: asString atRow: anInteger [

(1 to: mapWidth ) do: [ :each | mapArray at: anInteger at:each put: (asString at: each)].  
]

{ #category : #getteres }
Map >> maxHeight [
	^ mapHeight .
]

{ #category : #getteres }
Map >> maxWidth [
	^ mapWidth .
]
