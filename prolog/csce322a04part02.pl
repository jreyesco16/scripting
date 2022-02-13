fewestSlides(Maze,Path):-
    find2D(Maze, 1, (X,Y)),
    find2D(Maze, g, (I,J)),
    change2D(Maze,-,(X,Y),NM),
    change2D(NM,1,(I,J),To),
    bfs(Maze,1,To,Pathsize),!,
    length(Pathsize, Pl),!,
    bfs(Maze, 1, To, Path), between(1,10, Pl),length(Path,Pl).
    
