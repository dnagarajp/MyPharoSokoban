Class {
	#name : #Sokoban,
	#superclass : #Object,
	#instVars : [
		'mapWidth',
		'mapHeight',
		'mapArray',
		'desSquaresArray',
		'x',
		'y',
		'playerPosition'
	],
	#category : #MySokoban
}

{ #category : #mainMethods }
Sokoban >> calculateDesSquares [

	| cell |

	0 to: mapHeight-1 do: [ :row | 
		0 to: mapWidth-1 do: [ :col | 
			cell := row * mapWidth + col+ 1.
			((mapArray at: cell) == $x or: (mapArray at: cell) == $O) ifTrue: [ 
				desSquaresArray add: cell ] ] ].
	
]

{ #category : #'getteres and setters' }
Sokoban >> desSquaresArray [

	^ desSquaresArray
]

{ #category : #mainMethods }
Sokoban >> desSquaresCount [

	^ desSquaresArray size.
]

{ #category : #mainMethods }
Sokoban >> displayMap [

	0 to: (mapArray length)  do: [ :each | mapArray cr ].

]

{ #category : #'getteres and setters' }
Sokoban >> enterKey: akey [

" switch(key)
        {
            case 'w':
            obj.PLAYER_POSITION();
            obj.MoveCharacter(man.x, man.y, - MAP_WIDTH);
            obj.display();
            break;
           
            case 's':
            PLAYER_POSITION();
            MoveCharacter(man.x, man.y, MAP_WIDTH);
            display();
            break;
           
            case 'a':
            PLAYER_POSITION()
            MoveCharacter(man.x, man.y, - 1); break;
           
            case 'd':
            PLAYER_POSITION();
            MoveCharacter(man.x, man.y, 1); break;
        }
"


]

{ #category : #mainMethods }
Sokoban >> getPositionManXY [
| cell|

	0 to: mapHeight - 1 do: [ :row | 
		0 to: mapWidth - 1 do: [ :col | 
			cell := row * mapWidth + col+1.
			((mapArray at: cell) == $@) ifTrue: [ 
				 x := row+1. y :=col+1]]].

]

{ #category : #initialization }
Sokoban >> initialize [

	mapWidth := 8.
	mapHeight := 10.
	x := 0.
	y := 0.
	desSquaresArray := OrderedCollection new.
	self mapInitialize.
	self calculateDesSquares.
	self getPositionManXY.
	self mapArraySize.
	
]

{ #category : #mainMethods }
Sokoban >> mainToCallFucntion [

"    if(key == 0) break;    
        key = getch(); //input from user
        GetPosition();
        switch(key)
        {
            case 'w':
            obj.PLAYER_POSITION();
            obj.MoveCharacter(man.x, man.y, - MAP_WIDTH);
            obj.display();
            break;
           
            case 's':
            PLAYER_POSITION();
            MoveCharacter(man.x, man.y, MAP_WIDTH);
            display();
            break;
           
            case 'a':
            PLAYER_POSITION()
            MoveCharacter(man.x, man.y, - 1); break;
           
            case 'd':
            PLAYER_POSITION();
            MoveCharacter(man.x, man.y, 1); break;
        }

        dest_count = 0;                                                 // reset 'x' cells counter

        for(int i = 0; i < 10; i++)                                     // for all destination player positions
        {            
            if(map[dest_squares[i]] == 'O') dest_count++;               // increase 'x' cells counter if box is on 'x' cell
       
            if(map[dest_squares[i]] == ' ')                             // if 'x' cell has been erased
                map[dest_squares[i]] = 'x';                             // restore it
        }
       
        // if all boxes are on it's places break out of game loop
        if(dest_num == dest_count)
        {
            print YOU WIN;
            break;
        }      
    }
    return 0;"

]

{ #category : #'getteres and setters' }
Sokoban >> mapArray [

^ mapArray.

]

{ #category : #'getteres and setters' }
Sokoban >> mapArraySize [

^ mapArray size.
]

{ #category : #getters }
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

{ #category : #mainMethods }
Sokoban >> mapStoreLine: asString atRow: anInteger [

(1 to: mapWidth ) do: [ :each | mapArray at: anInteger at:each put: (asString at: each)].  
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
Sokoban >> moveCharacterX: xPos y: yPos offset: offsetNumber [

	| newPosition |
	(mapArray at: playerPosition + offsetNumber) ~= $# ifTrue: [ "1st if"
		(mapArray at: playerPosition + offsetNumber == $B)
		| (mapArray at: playerPosition + offsetNumber == $O)
		& (mapArray at: playerPosition + (offsetNumber * 2) ~= $#)
		| (mapArray at: playerPosition + (offsetNumber * 2) ~= $B)
		| (mapArray at: playerPosition + (offsetNumber * 2) ~= $O)
			ifTrue: [ "2nd if"
				mapArray playerPosition: Character space.
				x := x + offsetNumber.
				(mapArray at: playerPosition + offsetNumber) == Character space 
					ifTrue: [ "3rd if Open"
						newPosition := playerPosition + offsetNumber.
						mapArray newPosition: $B ]. "3rd if close"
				(mapArray at: playerPosition + offsetNumber == $x)
					ifTrue: [ 
						newPosition := playerPosition + offsetNumber.
						mapArray newPosition: $O ]
					ifFalse: [ 
						newPosition := playerPosition - offsetNumber.
						self mapArray newPosition: $@ ]. 
					mapArray playerPosition: $@]
			ifFalse: [ 
				mapArray playerPosition: Character space.
				x := x + offsetNumber.
				mapArray playerPosition: $@ ] ]
]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition [

| playerPosition1 |

playerPosition1 := (((y * mapWidth) +x) -1).

^ playerPosition1.


]

{ #category : #'getteres and setters' }
Sokoban >> playerPosition: anInteger [

	playerPosition := anInteger.
]

{ #category : #initialization }
Sokoban >> printOn: aStream [

super printOn: aStream.
aStream nextPutAll: ' with value: '.
mapArray do: [:i | aStream << i printString ].
]

{ #category : #'getteres and setters' }
Sokoban >> x [

^x.
]

{ #category : #'getteres and setters' }
Sokoban >> x: anInteger [

 x:= anInteger 
]

{ #category : #'getteres and setters' }
Sokoban >> y [

^y.
]

{ #category : #'getteres and setters' }
Sokoban >> y: anInteger [

 y:= anInteger 
]
