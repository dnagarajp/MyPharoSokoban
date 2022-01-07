Class {
	#name : #Man,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #MySokoban
}

{ #category : #initialization }
Man >> initialize [ 

x := 0.
y := 0.


]

{ #category : #getters }
Man >> x [
	^ x
]

{ #category : #getters }
Man >> y [
	^ y
]
