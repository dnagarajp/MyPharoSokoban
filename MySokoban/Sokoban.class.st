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

{ #category : #getters }
Sokoban >> calculateDesSquares [

	| cell |

	0 to: mapHeight-1 do: [ :row | 
		0 to: mapWidth-1 do: [ :col | 
			cell := row * mapWidth + col+ 1.
			((mapArray at: cell) == $x or: (mapArray at: cell) == $O) ifTrue: [ 
				desSquaresArray add: cell ] ] ]
]

{ #category : #getters }
Sokoban >> desSquaresArray [

	^ desSquaresArray
]

{ #category : #getters }
Sokoban >> desSquaresCount [

	^ desSquaresArray size.
]

{ #category : #getters }
Sokoban >> displayMap [

	0 to: (mapArray length)  do: [ :each | mapArray cr ].

]

{ #category : #getters }
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

{ #category : #getters }
Sokoban >> getPositionXY [
| cell|

	0 to: mapHeight - 1 do: [ :row | 
		0 to: mapWidth - 1 do: [ :col | 
			cell := row * mapWidth + col + 1.
			((mapArray at: cell) == $@) ifTrue: [ 
				 x := col. y :=row]]].
	
	Transcript show: cell ;cr.
	Transcript show:x.
	Transcript show:y.
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
	self getPositionXY.
	self playerPosition. 
	self mapArraySize.
]

{ #category : #getters }
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

{ #category : #getters }
Sokoban >> mapArray [

^ mapArray.

]

{ #category : #getters }
Sokoban >> mapArraySize [

^ mapArray size.
]

{ #category : #getters }
Sokoban >> mapInitialize [

	mapArray  := '#####   ',
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
Sokoban >> mapStoreLine: asString atRow: anInteger [

(1 to: mapWidth ) do: [ :each | mapArray at: anInteger at:each put: (asString at: each)].  
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
Sokoban >> moveCharacterX: xPos y: yPos offset: offsetNumber [
"if(map[PLAYER_POSITION + offset] != '#')                            // if player doesn't hit the wall
    {
        if(((map[PLAYER_POSITION + offset] == 'B') ||                   // if player hits the box
            (map[PLAYER_POSITION + offset] == 'O')) &&                  // or the box on 'x' cell
            (map[PLAYER_POSITION + offset * 2] != '#' ||                // and box doesn't hit a wall
             map[PLAYER_POSITION + offset * 2] != 'B' ||                // or another box
             map[PLAYER_POSITION + offset * 2] != 'O'))                 // or box on 'x' cell
        {
            map[PLAYER_POSITION] = ' ';                                 // clear previous player's position
            man.x = man.x + offset;                                            // update player's coordinate

            if(map[PLAYER_POSITION + offset] == ' ')                    // if the player position next to the box is empty
                map[PLAYER_POSITION + offset] = 'B';                    // push the box

            else if(map[PLAYER_POSITION + offset] == 'x')               // if the player position next to the box is 'x'  
                map[PLAYER_POSITION + offset] = 'O';                    // mark the box is on it's place

            else
            {
                map[PLAYER_POSITION - offset] = '@';                    // if box hits the wall or another box
                return;                                                 // don't push it any further
            }

            map[PLAYER_POSITION] = '@';                                 // draw the player in the new position
        }

        else                                                            // if the player position next to the player is empty                                                        
        {
            map[PLAYER_POSITION] = ' ';                                 // clear previous player position
            man.x = man.x + offset;                                            // update player's coordinate
            map[PLAYER_POSITION] = '@';                                 // draw the player in the new position
        }
    }  "
	(mapArray at: playerPosition + offsetNumber) ~= $# ifTrue: [ 
		(mapArray at: playerPosition + offsetNumber == $B) or:
		(mapArray at: playerPosition + offsetNumber == $O) and:
		(mapArray at: playerPosition + (offsetNumber * 2)  ~= $#) or:
	   (mapArray at: playerPosition + (offsetNumber * 2)  ~= $B) or:
		(mapArray at: playerPosition + (offsetNumber * 2)  ~= $O)].
		
	
]

{ #category : #getters }
Sokoban >> moveUp [

]

{ #category : #getters }
Sokoban >> playerPosition [

Transcript show: playerPosition.
^ playerPosition.


]

{ #category : #getters }
Sokoban >> playerPosition: anInteger [

playerPosition := anInteger .


]

{ #category : #getters }
Sokoban >> printOn: aStream [

super printOn: aStream.
aStream nextPutAll: ' with value: ', mapArray printString.
]

{ #category : #getters }
Sokoban >> x [

^x.
]

{ #category : #getters }
Sokoban >> x: anInteger [

 x:= anInteger 
]

{ #category : #getters }
Sokoban >> y [

^y.
]

{ #category : #getters }
Sokoban >> y: anInteger [

 y:= anInteger 
]
