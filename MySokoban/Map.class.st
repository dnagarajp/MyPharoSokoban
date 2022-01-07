Class {
	#name : #Map,
	#superclass : #Object,
	#instVars : [
		'mapWidth',
		'mapHeight',
		'mapArray'
	],
	#category : #MySokoban
}

{ #category : #initialization }
Map >> initialize [ 

mapWidth := 8.
mapHeight := 10.

self mapInitialize. 

]

{ #category : #getters }
Map >> mapArray [

^ mapArray.

]

{ #category : #getters }
Map >> mapInitialize [

mapArray := Array2D rows: mapHeight columns: mapWidth.
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
