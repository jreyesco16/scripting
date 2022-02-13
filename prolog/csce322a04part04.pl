noAdvantage(Maze):-
    player_list(Maze,Pl),
    sort(Pl, Plist),
    reverse(Plist, List),
    shortPath(Maze, List, 1),!.


    
    

