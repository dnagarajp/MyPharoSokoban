Class {
	#name : #Sokoban,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #MySokoban
}

{ #category : #initialization }
Sokoban >> initialize [ 

x := 0.
y := 0.
]

{ #category : #getters }
Sokoban >> x [
	^ x
]

{ #category : #getters }
Sokoban >> y [
	^ y
]
