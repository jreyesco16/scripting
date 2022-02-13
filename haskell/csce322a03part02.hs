import Prelude
import System.Environment ( getArgs )
import Data.List
import Helpers
  
-- The main method that will be used for testing / command line access
main = do
     args <- getArgs
     filename <- readFile (head args)
     (moves,maze) <- readMazeFile filename
     print "Result"
     printMaze (onePlayerManySlides maze moves)

-- YOUR CODE SHOULD COME AFTER THIS POINT
onePlayerManySlides :: [[Char]] -> [Char] -> [[Char]]
onePlayerManySlides ma (h:t) 
    | t == [] = makeMove ma h '1'
    | otherwise = onePlayerManySlides (makeMove ma h '1') t
