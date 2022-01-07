Class {
	#name : #Sokoban,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'mapWidth',
		'mapHeight',
		'map'
	],
	#category : #MySokoban
}

{ #category : #initialization }
Sokoban >> initialize [ 

x := 0.
y := 0.
mapWidth := 8.
mapHeight := 10.

self mapInitialize. 

]

{ #category : #getters }
Sokoban >> map [

^ map.

]

{ #category : #getters }
Sokoban >> mapInitialize [

map := Array2D rows: mapHeight columns: mapWidth.
self mapStoreLine: '#####   ' atRow: 1.
self mapStoreLine: '#xB ### ' atRow: 2.
self mapStoreLine: '###   # ' atRow: 3.
self mapStoreLine: '#x@B  # ' atRow: 4.
self mapStoreLine: '### Bx# ' atRow: 5.
self mapStoreLine: '#x##B # ' atRow: 6.
self mapStoreLine: '# # x ##' atRow: 7.
self mapStoreLine: '#B OBBx#' atRow: 8.
self mapStoreLine: '#   x  #' atRow: 9.
self mapStoreLine: '########' atRow: 10.

]

{ #category : #getters }
Sokoban >> mapStoreLine: asString atRow: anInteger [

(1 to: mapWidth ) do: [ :each | map at: anInteger at:each put: (asString at: each)].  
]

{ #category : #getteres }
Sokoban >> maxHeight [
	^ mapHeight .
]

{ #category : #getteres }
Sokoban >> maxWidth [
	^ mapWidth .
]

{ #category : #getters }
Sokoban >> x [
	^ x
]

{ #category : #getters }
Sokoban >> y [
	^ y
]
