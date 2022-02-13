%%check if there is empty space next a goal if not than false
goalWall(Maze):-
    find2D(Maze, g, (X,Y)),
    Xplus is X + 1,
    find2D(Maze,x,(Xplus,Y)),!.
goalWall(Maze):-
    find2D(Maze, g, (X,Y)),
    Xminus is X - 1,
    find2D(Maze, x, (Xminus, Y)), !.
goalWall(Maze):-
    find2D(Maze, g, (X,Y)),
    Yminus is Y - 1,
    find2D(Maze, x, (X,Yminus)), !.
goalWall(Maze):-
    find2D(Maze, g, (X,Y)),
    Yplus is Y + 1,
    find2D(Maze,x,(X,Yplus)),!.


