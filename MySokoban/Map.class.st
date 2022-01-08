Class {
	#name : #Map,
	#superclass : #Object,
	#instVars : [
		'mapWidth',
		'mapHeight',
		'mapArray',
		'desSquaresArray',
		'x',
		'y'
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
Map >> getPositionXY [
| cell man|
man := Man new.

	0 to: mapHeight - 1 do: [ :row | 
		0 to: mapWidth - 1 do: [ :col | 
			cell := row * mapWidth + col + 1.
			((mapArray at: cell) == $@) ifTrue: [ 
				 x := col. y :=row]]].
	
	Transcript show: man;cr.
]

{ #category : #initialization }
Map >> initialize [

	mapWidth := 8.
	mapHeight := 10.
	x := 0.
	y := 0.
	desSquaresArray := OrderedCollection new.
	self mapInitialize.
	self calculateDesSquares.
	self getPositionXY 
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

{ #category : #getters }
Map >> moveUp [

]

{ #category : #getters }
Map >> x [

^x.
]

{ #category : #getters }
Map >> x: anInteger [

 x:= anInteger 
]

{ #category : #getters }
Map >> y [

^y.
]

{ #category : #getters }
Map >> y: anInteger [

 y:= anInteger 
]
