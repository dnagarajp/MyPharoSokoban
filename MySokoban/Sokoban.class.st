Class {
	#name : #Sokoban,
	#superclass : #Object,
	#instVars : [
		'x',
		'y',
		'mapWidth',
		'mapHeight'
	],
	#category : #MySokoban
}

{ #category : #initialization }
Sokoban >> initialize [ 

x := 0.
y := 0.
mapWidth := 8.
mapHeight := 10.
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
