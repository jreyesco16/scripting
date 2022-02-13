module Helpers
( readMazeFile
, printMaze
, makeMove
, playerList
, quicksort
, member
, manyPlayerOneSlideHelp
, manyPlayersManySlidesHelp
) where

import Prelude
import Data.Char

readMazeFile :: String -> IO ([Char],[[Char]])
readMazeFile = readIO

printMaze :: [[Char]] -> IO ()
printMaze [] = do
           print "END"
printMaze (ro:ros) = do
             print ro
             printMaze ros


--find is used for finding a given object in an array
find :: Eq a => a -> [a] -> [Int]
find _ [] = []
find e (h:t)
        | e == h = [0] ++ (map (+1) (find e t))
        | otherwise = (map (+1) (find e t))

--find2D returns list of the indexs of player one
find2D :: Eq a => a -> [[a]] -> [(Int,Int)] 
find2D _ [] = []
find2D el (row:rows) = add ++ next
        where   first  = find el row
                add    = [(0,c)|c<-first]
                rest   = (find2D el rows)
                next   = [(r,c)|(a,c)<-rest, let r=a+1]


-- Jesse: traversing matrix UP , will move up LEFT of list if down on horizontal row
moveUp :: [[Char]] -> Char -> [[Char]]
--[[Char]] will be the maze, Char will be the player # , [[Char]] will return the updated matrix
--first let us get the column of the player                                           --j in game matrix
moveUp ma p = setCol ma (left (getCol ma (head(map snd (find2D p ma))) ) p False)   (head (map snd (find2D p ma)))

-- Jesse: traversing matrix DOWN
moveDown :: [[Char]] -> Char -> [[Char]]
moveDown ma p = setCol ma (right (getCol ma (head (map snd (find2D p ma))) ) p False) (head (map snd (find2D p ma)))

-- Jesse: traversing matrix LEFT, reverses the the list passed in and uses moveRight on list and reverses again
moveLeft :: [[Char]] -> Char -> [[Char]]
moveLeft ma p = setRow ma (left (getRow ma (head (map fst (find2D p ma))) ) p False) (head (map fst (find2D p ma)))

-- Jesse: traversing matrix RIGHT       (done)
moveRight :: [[Char]] -> Char -> [[Char]]
moveRight ma p = setRow ma (right (getRow ma (head (map fst (find2D p ma))) ) p False) (head (map fst (find2D p ma)))

--left will do the oppisite of right
left :: [Char] -> Char -> Bool -> [Char]
left [] p False = []
left row p bool = reverse (right (reverse row) p bool)

--right simply moves a player in list to the rightmost in according to rules of game
right :: [Char] -> Char -> Bool -> [Char]
right [] p False = []
right (h:t) p bool
        | (h == p) &&  (not (member (head t) "x123456789")) = '-':(right t p True)
        | bool == False = h:(right t p False)
        | (bool == True) && (h == 'g') = p : t
        | (bool == True) && (member (head t) "x123456789") = p : t
        | (bool == True) && (h == '-') = h : (right t p True)
        | otherwise = right t p False
--helps right to accomplish its goal
member :: Char -> [Char] -> Bool
member _ [] = False
member e (h:t) 
        | e == h = True
        | otherwise = (member e t)


--findG checks for a goal in the maze, if it doesn't find one then we know that the game has been won
findG :: [[Char]] -> Bool
findG [] = True
findG (ro:ros) 
        | (member 'g' ro) = False
        | otherwise = findG ros
 
--get rows      (done)
getRow :: [[Char]] -> Int -> [Char]
getRow [] _ = []
getRow (ro:ros) 0 = ro
getRow (ro:ros) i = getRow ros (i-1)

--get columns   (done)
getCol :: [[a]] -> Int -> [a]
getCol [] _ = []
getCol (ro : ros) c = (getItem ro c) : (getCol ros c)
--used in get columns and item from a row       (done)
getItem :: [a] -> Int -> a
getItem (h:t) 0 = h 
getItem (h:t) i = getItem t (i-1)



-- get the first move from the move list
makeMove :: [[Char]] -> Char -> Char -> [[Char]]
makeMove ma mo p
        | (findG ma) = ma
        | mo == 'u' = moveUp ma p
        | mo == 'd' = moveDown ma p
        | mo == 'r' = moveRight ma p
        | mo == 'l' = moveLeft ma p


--set column 
setCol :: [[Char]] -> [Char] -> Int -> [[Char]] 
setCol [] [] _ = []
setCol (ro:ros) (h:t) j = (set ro h j):(setCol ros t j)

--set value for an index in a row
set :: [Char] -> Char -> Int -> [Char]
set (h:t) el 0 = (el:t)
set (h:t) el n = h:(set t el (n-1)) 

--set row 
setRow :: [[Char]] -> [Char] -> Int -> [[Char]]
setRow [] [] _ = []
setRow (ro : ros) newRo 0 = newRo:ros
setRow (ro : ros) newRo i = ro:(setRow ros newRo (i-1))


--create a list of the playeys in the matix, this list of all charcters for the players
playerList :: [[Char]] -> [Char]
playerList [] = []
playerList (ro:ros) = [] ++ (getPlayer ro) ++ (playerList ros)



--get a player from a row
getPlayer :: [Char] -> [Char]
getPlayer [] = []
getPlayer (h:t)
        | (member h "123456789") = [] ++ [h] ++ (getPlayer t)
        | otherwise = getPlayer t


--quicksort to be applied on the list of players
quicksort :: Ord e => [e] -> [e]
quicksort [] = []
quicksort (el:rest) = (quicksort [x|x <- rest, x <= el]) ++ [el] ++ ( quicksort [y|y<-rest, y > el])

--helps cscea03part03.hs manipulate the player list
manyPlayerOneSlideHelp :: [[Char]] -> [Char] -> [Char] -> [[Char]]
manyPlayerOneSlideHelp ma mo [] = ma
manyPlayerOneSlideHelp ma (h:t) (p:restp) = manyPlayerOneSlideHelp (makeMove ma h p) t restp

--helps the cscea03part04.hs manipulate the player list and the move list
manyPlayersManySlidesHelp :: [[Char]] -> [Char] -> [Char] -> [[Char]]
manyPlayersManySlidesHelp ma [] pList = ma
manyPlayersManySlidesHelp ma mos [] = manyPlayersManySlidesHelp ma mos (quicksort (playerList ma))
manyPlayersManySlidesHelp ma (h:t) (p:restP) = manyPlayersManySlidesHelp (makeMove ma h p) t restP




moveRightRub :: [Char] -> Char -> [Char]
moveRightRub [] player = []
moveRightRub (h:t) player
        | otherwise = moveRightRub t player
