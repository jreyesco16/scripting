%%this first colsAndPlayers checks if the columns and player list are both even or odd
colsAndPlayers([R|Rows]):-
    player_list([R|Rows], Pl),
    column_length(Pl,L),
    column_length(R, S),
    Lmod is mod(L,2),
    Smod is mod(S,2),
    Lmod == Smod.
    

    

