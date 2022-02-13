:- module( helpers,
	 [ readMazeGame/3
	 , printMazeGame/1
     , player_list/2
     , column_length/2
     , change2D/4
     , bfs/4
     , find2D/3
     , shortPath/3
     , bfsPath/3
	 ]
    ).

dropLast([_],[]).
dropLast([H|T],[H|R]):-
    dropLast(T,R).

readMazeGame(File,Moves,Maze):-
    open(File,read,Input),
    read(Input,Moves),
    readMaze(Input,Temp),
    dropLast(Temp,Maze),
    close(Input).

readMaze(Input,[]):-
    at_end_of_stream(Input),
    !.
readMaze(Input,[Row|Rows]):-
    \+ at_end_of_stream(Input),
    read(Input,Row),
    readMaze(Input,Rows).

printMazeGame([]).
printMazeGame([Row|Rows]):-
    writeln(Row),
    printMazeGame(Rows).



%%all possible players
player(1).
player(2).
player(3).
player(4).
player(5).
player(6).
player(7).
player(8).
player(9).

%%wall possibilities
wall(1).
wall(2).
wall(3).
wall(4).
wall(5).
wall(6).
wall(7).
wall(8).
wall(9).
wall(x).

%%move possibilities
move(-).
move(g).


%%edge possibilities
edge(M, P, r, NM):-
    move_right(M,P, NM),
    M \= NM.
edge(M, P, l, NM):-
    move_left(M, P, NM),
    M \= NM.
edge(M, P, u, NM):-
    move_up(M, P, NM),
    M \= NM.
edge(M, P, d, NM):-
    move_down(M, P, NM),
    M \= NM.



%%cretate a list of players certain players are found in row
player_row([],[]).
player_row([H|T], [H|L]):-
    player(H),!,
    player_row(T, L). 
player_row([_|T], L):-
    player_row(T, L).




%%create list of players for entire matrix
player_list([],[]).
player_list([R|Rows],Pls ):-
    player_row(R,Pl), !,
    player_list(Rows, L),
    append(Pl,L,Pls).



%%get length of columns of a matrix
column_length([], 0).
column_length([_|T], Sum):-
    column_length(T, Num),
    Sum is Num + 1.

%%get length of rows of a matrix
row_length([], 0).
row_length([_|R], Sum):-
    row_length(R, Num),
    Sum is Num + 1.



%%this is RYAN PATRICKS code, this is not mine
% find(List,What,Where)
find([What|_],What,1).
find([_|T],What,Where):-
    find(T,What,WhereT),
    Where is WhereT + 1.
    
% find2D(ListOfLists,What,Where)
% find2D([Row|Rows],What,(RowL,ColL))
find2D([Row|_],What,(1,C)):-    
    find(Row,What,C).
find2D([_|Rows],What,(R,RowsC)):-    
    find2D(Rows,What,(RowsR,RowsC)),
    R is RowsR + 1.

% getCol(Maze,ColNum,Col).
getCol([],_,[]).
getCol([Row|Rows],ColNum,[This|Those]):-
    find(Row,This,ColNum),
    getCol(Rows,ColNum,Those).


% set(Before,NewElement,Position,After)
set([_|T],NewElement,1,[NewElement|T]).
set([H|T],NewElement,P,[H|NewT]):-
    length([H|T],Len),between(1,Len,P),
    PM1 is P - 1,
    set(T,NewElement,PM1,NewT).
    
% change2D([Row|Rows],NewElement,(R,C),Result)
change2D([Row|Rows],NewElement,(1,C),[NewRow|Rows]):-
    set(Row,NewElement,C,NewRow).
change2D([Row|Rows],NewElement,(R,C),[Row|Result]):-
    length([Row|Rows],NumRows),
    between(1,NumRows,R),
    RNew is R - 1,
    change2D(Rows,NewElement,(RNew,C),Result).

%% bfs(Startmaze, P, Endmaze, Path) returns the shortest paths with in the path length of 10
bfs(From, _, From,[]).
bfs(From,P,To,[M|Rest]):-
    between(0,10,Length),length(Rest,Length),
    edge(From, P, M, Newmaze),
    bfs(Newmaze, P, To, Rest).

%% find the shortest path for Player
bfsPath(Maze, P, Path):-
    find2D(Maze, P, (X,Y)),
    find2D(Maze, g, (I,J)),
    change2D(Maze,-,(X,Y),NM),
    change2D(NM,P,(I,J),To),
    bfs(Maze,P,To,Path),!.














%%check if the shortest path is 1
%%shortPath(Maze, Playerlist, Player)
shortPath(_,[_],P):- 
    P is 1.
%%the current player has no path so skip
shortPath(Maze,[H|T], P):-
    not(bfsPath(Maze,H,_)),
    shortPath(Maze, T, P).
%%the current player has the shortest path so far so switch the path
shortPath(Maze,[H|T],P):-
    P is 1,
    bfsPath(Maze,H, NP),
    bfsPath(Maze,1, CP),
    length(NP, NS),
    length(CP, CS),
    NS < CS,
    false.
%% the current players shortest path is not shorter then the current one
shortPath(Maze,[H|T],P):-
    P is 1,
    bfsPath(Maze,H, NP),
    bfsPath(Maze,1, CP),
    length(NP, NS),
    length(CP, CS),
    NS >= CS,
    shortPath(Maze,T,P).




















%%shortestPath(StartMaze, PlayerList, Player)
%%shortestPath(_, [], P):-
%%    P is 1,!.
%%find the bfs for player 1
%%shortestPath(Maze,[H|T], P):-
%%    H is 1,
%%    bfsPath(Maze,H,Player1),!,
%%    shortestPath(Maze, T, H),!.

%%here we have found a path that is shorter length then the previos one
%%shortestPath(Maze, [H|T], P):-
%    bfsPath(Maze,P, Path),
%    bfsPath(Maze,H,Newpath),
 %   length(Path, S),
  %  length(Newpath, NS),
   % S > NS,
 %   shortestPath(Maze, T, H),!.
%%here we have found a path that is not shorter length then the previos one
%shortestPath(Maze, [H|T], P):-
 %   bfsPath(Maze,P,Path),!,
%    bfsPath(Maze,H,Newpath),!,
%    length(Path, S),
%    length(Newpath, NS),
%    S < NS,
%    shortestPath(Maze, T, P),!.
%%this function will determine if no path found and if so then 
%shortestPath(Maze, [H|T], P, Path):-
%    find2D(Maze, H, (X,Y)),
%    find2D(Maze, g, (I,J)),
%    change2D(Maze,-,(X,Y),NM),
%    change2D(NM,1,(I,J),To),
%    not(bfs(Maze,H, To, Newpath)),
%    shortestPath(Maze, T, P, Path).



%%change the row in a maze based on the index
change_row([_|T], Row, 1, [Row|T]).
change_row([R|Rows], Row, P, [R|NewR]):-
    length([R|Rows], Len),between(1, Len, P),
    PM1 is P - 1,
    change_row(Rows, Row, PM1, NewR).

set_col([], [], _, []).
set_col([R|Rows], [H|T], I, [Newrow|Newerows]):-
    set(R, H, I, Newrow),
    set_col(Rows, T, I, Newerows).










%% OPERATIONS FOR MANIPULATING PLAYER MOVES
%move players to end of a list, the last function find goal
right(List, P, Newlist):-
    find(List, P, Y),
    Yplus is Y + 1,
    find(List,X,Yplus),
    wall(X),
    set(List, P, Y, Newlist),!.
right(List, P, Newlist):-
    find(List, P, Y),
    Yplus is Y + 1,
    find(List, -, Yplus),!,
    set(List, - , Y, Midlist),!,
    set(Midlist, P, Yplus, BFlist),!,
    right(BFlist, P, Newlist).
right(List, P, Newlist):-
    find(List, P, Y),
    Yplus is Y + 1,
    find(List, g, Yplus),!,
    set(List, - , Y, Midlist),!,
    set(Midlist, P, Yplus, Newlist),!.

%%make the player move left
left(List, P, Newlist):-
    find(List,P, Y),
    Yminus is Y - 1,
    find(List,X,Yminus),
    wall(X),
    set(List, P, Y, Newlist),!.
left(List, P, Newlist):-
    reverse(List, Rlist),
    right(Rlist, P, BFlist),
    reverse(BFlist,Newlist).

%%move player right in 2d matrix
move_right(Maze, P, Newmaze):-
    find2D(Maze, P, (X,_)),
    find(Maze,Row,X),
    right(Row, P, Newrow),
    change_row(Maze, Newrow, X, Newmaze).

%%move player left in matrix
move_left(Maze, P, Newmaze):-
    find2D(Maze, P, (X,_)),
    find(Maze,Row,X),
    left(Row, P, Newrow),
    change_row(Maze, Newrow, X, Newmaze).

%%move a player up in matrix
move_up(Maze, P, NewMaze):-
    find2D(Maze, P, (_,Y)),
    getCol(Maze, Y, Col),
    left(Col, P, Newcol),
    set_col(Maze, Newcol, Y, NewMaze).

%%move a player down in matrix
move_down(Maze, P, NewMaze):-
    find2D(Maze, P, (_,Y)),
    getCol(Maze, Y, Col),
    right(Col, P, Newcol),
    set_col(Maze, Newcol, Y, NewMaze).

